<?php
require_once 'functions.php';

date_default_timezone_set('America/Costa_Rica');

/**
 * Function to extract CDATA content from an XML element
 *
 * @param content The content to extract CDATA from
 * @return string Returns the extracted CDATA content or stripped HTML tags if CDATA is not present.
 */
function extractCD($content)
{
    $cdataContent = '';
    preg_match('/<!\[CDATA\[(.*?)\]\]>/s', $content, $matches);
    if (isset($matches[1])) {
        $cdataContent = $matches[1];
    }
    $content = preg_replace('/<img[^>]+src="([^"]+)"[^>]*>/i', '', $content);

    return !empty($cdataContent) ? $cdataContent : strip_tags($content);
}

/**
 * Function to get the image URL from an RSS item
 *
 * @param item The RSS item element
 * @return string Returns the image URL if found, or an empty string if not found.
 */
function getImgURL($item)
{
    preg_match('/<img[^>]+src="([^"]+)"[^>]*>/i', $item->description, $match);

    if (isset($item->enclosure['url'])) {
        return (string) $item->enclosure['url'];
    } elseif (isset($item->{'media:content'}['url'])) {
        return (string) $item->{'media:content'}['url'];
    } elseif (isset($match[1])) {
        return $match[1];
    }

    return "https://static.vecteezy.com/system/resources/previews/004/776/093/non_2x/photo-icon-or-picture-icon-image-sign-and-symbol-vector.jpg";
}

/**
 * Function to extract categories from the item and associate them with the news
 *
 * @param item The RSS item element
 * @param newsId The ID of the news item
 */
function processTags($item, $newsId)
{
    if (isset($item->category)) {
        foreach ($item->category as $category) {
            saveTags($newsId, (string) $category);
        }
    }
}

/**
 * Function to process and store news in the database from an RSS source
 *
 * @param newsSource An associative array with information about the news source
 */
function processNews($newsSource)
{
    $rssUrl = $newsSource['url'];
    $rssFeed = simplexml_load_file($rssUrl);

    if ($rssFeed) {
        foreach ($rssFeed->channel->item as $item) {
            $news = [
                'title' => extractCD($item->title),
                'description' => extractCD($item->description),
                'permalink' => (string) $item->link,
                'date' => date("Y-m-d h:i A", strtotime($item->pubDate)),
                'categoryId' => $newsSource['categoryId'],
                'userId' => $newsSource['userId'],
                'newsSourceId' => $newsSource['id'],
                'img' => (string) getImgURL($item),
            ];

            $newsId = saveNews($news);
            if ($newsId) {
                processTags($item, $newsId);
            }
        }
    } else {
        echo "No news sources found in the source: " . $newsSource['id'] . PHP_EOL;
    }
}

/**
 * Function to process news XML for all users from their news feeds
 */
function processUserNews()
{
    deleteAllNews();
    $users = getUsers();

    foreach ($users as $user) {
        $newsSources = getNewsSources($user['id']);

        foreach ($newsSources as $newsSource) {
            processNews($newsSource);
        }
    }
}

// Call the function to execute the user news processing
processUserNews();

echo "News update process completed." . PHP_EOL;
