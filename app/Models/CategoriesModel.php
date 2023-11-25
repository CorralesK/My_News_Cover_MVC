<?php

namespace App\Models;

use CodeIgniter\Model;

class CategoriesModel extends Model
{
    protected $table            = 'categories';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['name'];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = ['checkAssoc'];
    protected $afterDelete    = [];

    public function initialize() {}

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
}
