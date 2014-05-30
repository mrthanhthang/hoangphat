<?php
namespace Admin\Model;

class Category
{
    public $id;
    public $name;
    public $image;
    public $parent_id;

    public function exchangeArray($data)
    {
        $this->id            = (isset($data['id'])) ? $data['id'] : null;
        $this->name          = (isset($data['name'])) ? $data['name'] : null;
        $this->image         = (isset($data['image'])) ? $data['image'] : null;
        $this->parent_id     = (isset($data['parent_id'])) ? $data['parent_id'] : null;
    }
    
    // Add the following method:
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}

?>