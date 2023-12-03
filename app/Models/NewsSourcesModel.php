<?php

namespace App\Models;

use CodeIgniter\Model;

class NewsSources extends Model
{
    protected $table = 'newssources';
    protected $primaryKey = 'id';
    protected $useAutoIncrement = true;
    protected $returnType = 'array';
    protected $useSoftDeletes = false;
    protected $protectFields = true;
    protected $allowedFields = ['url', 'name', 'categoryId', 'userId'];

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
    protected $beforeDelete = ['deleteNews'];
    protected $afterDelete = [];

    public function initialize()
    {}

    /**
     * Get news sources by user
     *
     * @param int $userId User ID
     * @return array News sources associated with the user
     */
    public function getByUser($userId)
    {
        $categoriesModel = new CategoriesModel();

        $sources = $this->where('userId', $userId)->findAll();

        foreach ($sources as &$source) {
            $source['categoryName'] = $categoriesModel->find($source['categoryId'])['name'];
        }

        return $sources;
    }

    /**
     * Callback to delete news related to a specific news source from the database
     *
     * @param array $data Data containing the news source id
     * @return bool Returns true if the news items were successfully deleted, or false in case of an error.
     */
    protected function deleteNews(array $data)
    {
        $sourceId = $data['id'];
        $newsModel = model(NewsModel::class);

        return $newsModel->where('newsSourceId', $sourceId)->delete();
    }

    /**
     * Check if a user has news sources
     *
     * @param user_id User's ID
     * @return bool Returns true if there are news sources for the user, or false otherwise.
     */
    public function hasNewsSources($userId)
    {
        return $this->where('userId', $userId)->countAllResults() > 0;
    }
}
