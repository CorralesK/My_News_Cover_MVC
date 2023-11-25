<?php

namespace App\Models;

use CodeIgniter\Model;

class CategoriesModel extends Model
{
    protected $table = 'categories';
    protected $primaryKey = 'id';
    protected $useAutoIncrement = true;
    protected $returnType = 'array';
    protected $useSoftDeletes = false;
    protected $protectFields = true;
    protected $allowedFields = ['name'];

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
    protected $beforeDelete = ['checkAssoc'];
    protected $afterDelete = [];

    public function initialize() {}

    /**
     * Callback to check if there are associated news sources before deleting a category from the database
     *
     * @param array $data Data containing the category id
     * @return bool Returns true if there are no associated news sources, otherwise throws an exception.
     */
    protected function checkAssoc(array $data)
    {
        $categoryID = $data['id'];
        $sourcesModel = model(NewsSourcesModel::class);
        $assocSources = $sourcesModel->where('categoryId', $categoryID)->find();

        if (!empty($assocSources)) {
            throw new \Exception("No se puede eliminar la categoría porque está asociada a fuentes de noticias.");
        }
        return $data;
    }

    /**
     * Obtain categories in ascending order
     *
     * @return array Categories sorted by name
     */
    public function getCategories()
    {
        return $this->orderBy('name', 'ASC')->findAll();
    }

    /**
     * Get categories by user
     *
     * @param int $userId User ID
     * @return array Categories associated with the user
     */
    public function getByUser($userId)
    {
        return $this->select('id, name')
            ->where('id IN (SELECT DISTINCT categoryId FROM newssources WHERE userId = ' . $userId . ')')
            ->orderBy('name', 'ASC')
            ->findAll();
    }
}
