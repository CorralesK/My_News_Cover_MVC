<?php

/**
 * Gets a new MySQL connection
 *
 * @return mysqli Returns a MySQL database connection.
 */
function getConnection()
{
    $connection = new mysqli('localhost:3306', 'root', 'Admin12345', 'mynewscover');

    if ($connection->connect_errno) {
        printf("Connect failed: %s\n", $connection->connect_error);
        die;
    }
    return $connection;
}

/**
 * Get all users from the database
 *
 * @return array Returns an array of users from the database.
 */
function getUsers()
{
    $conn = getConnection();
    $sql = "SELECT * FROM users";
    $result = $conn->query($sql);

    if ($conn->connect_errno) {
        $conn->close();
        return [];
    }

    while ($row = mysqli_fetch_assoc($result)) {
        $users[] = $row;
    }
    $conn->close();
    return $users;
}

/**
 * Get all news sources from the database
 *
 * @param userId Id of the user with the current session
 * @return array Returns an array of news sources associated with the user.
 */
function getNewsSources($userId)
{
    $newsSources = [];

    $conn = getConnection();
    $sql = "SELECT * FROM newssources
            WHERE userId = '$userId'";
    $result = $conn->query($sql);

    if ($conn->connect_errno) {
        $conn->close();
        return [];
    }

    while ($row = mysqli_fetch_assoc($result)) {
        $newsSources[] = $row;
    }
    $conn->close();
    return $newsSources;
}

/**
 * Inserts a new news item in the database
 *
 * @param news An associative array with the news information
 * @return int|bool Returns the ID of the inserted news item if successful, or false in case of an error.
 */
function saveNews($news)
{
    $conn = getConnection();
    $sql = "INSERT INTO news (title, description, permanlink, date, newsSourceId, userId, categoryId, img)
            VALUES('{$news['title']}', '{$news['description']}', '{$news['permalink']}', '{$news['date']}',
            '{$news['newsSourceId']}', '{$news['userId']}', '{$news['categoryId']}', '{$news['img']}')";
    $result = $conn->query($sql);

    if ($conn->connect_errno || !$result) {
        $conn->close();
        return false;
    }    

    $newsId = $conn->insert_id;
    $conn->close();

    return $newsId;
}

/**
 * Deletes all news sources from the database.
 *
 * @return bool Returns true if the deletion was successful, or false in case of an error.
 */
function deleteAllNews()
{
    $conn = getConnection();
    $sql = "DELETE FROM news";
    $result = $conn->query($sql);

    if ($result) {
        if ($conn->affected_rows > 0) {
            $conn->close();
            return true;
        }
    }

    $conn->close();
    return false;
}

/**
 * Inserts tags into the database and associates them with a news item
 *
 * @param newsId The ID of the news item
 * @param tag Name of the tag
 */
function saveTags($newsId, $tag)
{
    $conn = getConnection();

    $tag = $conn->real_escape_string($tag);
    $result = $conn->query("SELECT id FROM tags WHERE name = '$tag'");

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $tagId = $row['id'];
    } else {
        $sql = "INSERT INTO tags (name) VALUES ('$tag')";
        $conn->query($sql);
        $tagId = $conn->insert_id;
    }

    // Associate the tag with the news item in the 'newstags' table
    $sql = "INSERT INTO newstags (newsId, tagId) VALUES ('$newsId', '$tagId')";
    $conn->query($sql);

    $conn->close();
}
