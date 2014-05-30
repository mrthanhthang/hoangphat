<?php
namespace Admin\Model;

class ArticleCategory
{
    public $id;
    public $parent_id;
    public $slug;
    public $name;
    public $keyword;    
    public $description;    
    public $position;
    public $properties;
    public $status;

    public function exchangeArray($data)
    {
        $this->id             = (isset($data['id'])) ? $data['id'] : null;
        $this->parent_id       = (isset($data['parent_id'])) ? $data['parent_id'] : null;
        $this->slug       = (isset($data['slug'])) ? $data['slug'] : null;
        $this->name       = (isset($data['name'])) ? $data['name'] : null;
        $this->keyword        = (isset($data['keyword'])) ? $data['keyword'] : null;
        $this->description          = (isset($data['description'])) ? $data['description'] : null;
        $this->position            = (isset($data['position'])) ? $data['position'] : null;
        $this->properties   = (isset($data['properties'])) ? unserialize($data['properties']) : null;      
        $this->status         = (isset($data['status'])) ? $data['status'] : null;
    }    
    // Add the following method:
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}
?>