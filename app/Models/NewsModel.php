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
}
