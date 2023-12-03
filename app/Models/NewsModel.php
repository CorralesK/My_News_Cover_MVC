<?php

namespace App\Models;

use CodeIgniter\Model;

class News extends Model
{
    protected $table = 'news';
    protected $primaryKey = 'id';
    protected $useAutoIncrement = true;
    protected $returnType = 'array';
    protected $useSoftDeletes = false;
    protected $protectFields = true;
    protected $allowedFields = ['title', 'description', 'permanlink', 'date', 'newsSourceId', 'userId', 'categoryId', 'img'];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat = 'datetime';
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';

    // Validation
    protected $validationRules = [];
    protected $validationMessages = [];
    protected $skipValidation = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert = [];
    protected $afterInsert = [];
    protected $beforeUpdate = [];
    protected $afterUpdate = [];
    protected $beforeFind = [];
    protected $afterFind = [];
    protected $beforeDelete = [];
    protected $afterDelete = [];

    public function initialize()
    {}

    /**
     * Get news articles associated with a specific user, optionally filtered by category.
     *
     * @param int      $userId   User ID for whom to retrieve news articles.
     * @param int|null $category Optional category ID to filter news articles.
     *
     * @return array Returns an array of news articles associated with the user, optionally filtered by category.
     */
    public function getNews($userId, $category = null)
    {
        $query = $this->select('id, title, description, permanlink, date, newsSourceId, userId, (SELECT c.name FROM categories AS c WHERE c.id = categoryId) AS category, img')
            ->where('userId', $userId);

        if ($category !== null) {
            $query->where('categoryId', $category);
        }

        return $query->orderBy('date', 'DESC')->findAll();
    }

    /**
     * Searches for news articles associated with a specific user based on a keyword.
     *
     * @param int    $userId User ID for whom to search news articles.
     * @param string $word   Keyword to search for in the title or description of news articles.
     *
     * @return array Returns an array of news articles that match the search criteria.
     */
    public function search($userId, $word)
    {
        $query = $this->select('id, title, description, permanlink, date, newsSourceId, userId, (SELECT c.name FROM categories AS c WHERE c.id = categoryId) AS category, img')
            ->where('userId', $userId);

        if ($word !== null) {
            $query->groupStart()
                ->orLike('title', $word)
                ->orLike('description', $word)
                ->groupEnd();
        }
        return $query->orderBy('date', 'DESC')->get(10)->getResultArray();
    }

    /**
     * Get news filtered by tags and user ID.
     *
     * @param int $userId The user ID for whom to retrieve news.
     * @param array $tags An array of tag IDs for filtering news. If empty, get all news for the user.
     * @return array An array of news items that match the specified criteria.
     */
    public function showBYTags($userId, $tags)
    {
        // If no tags are selected, retrieve all news for the user
        if (empty($tags)) {
            return $this->getNews($userId);
        }

        $query = $this->select('news.id, title, description, permanlink, date, newsSourceId, userId, GROUP_CONCAT(c.name) AS category, img')
            ->join('newstags AS nt', 'nt.newsId = news.id')
            ->join('categories AS c', 'c.id = categoryId', 'left')
            ->whereIn('nt.tagId', $tags)
            ->where('news.userId', $userId)
            ->groupBy('news.id');

        return $query->orderBy('date', 'DESC')->findAll();
    }
}
