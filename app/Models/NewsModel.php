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

    public function initialize() {}

    public function getNews($userId, $category = null)
    {
        $query = $this->select('id, title, description, permanlink, date, newsSourceId, userId, (SELECT c.name FROM categories AS c WHERE c.id = categoryId) AS category, img')
            ->where('userId', $userId);

        if ($category !== null) {
            $query->where('categoryId', $category);
        }

        return $query->orderBy('date', 'DESC')->findAll();
    }
}
