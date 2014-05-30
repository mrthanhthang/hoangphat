<?php
namespace Admin\Model;

class Article
{
    public $id;
    public $cat_id;
    public $slug;
    public $title;
    public $keyword;

    public $description;
    public $detail;
    public $viewed;
    public $date_created;
    public $status;

    public $position;
    public $properties;
    public $home;

    public function exchangeArray($data)
    {
        $this->id               = (isset($data['id'])) ? $data['id'] : null;
        $this->cat_id           = (isset($data['cat_id'])) ? $data['cat_id'] : null;
        $this->slug             = (isset($data['slug'])) ? $data['slug'] : null;
        $this->title            = (isset($data['title'])) ? $data['title'] : null;
        $this->keyword          = (isset($data['keyword'])) ? $data['keyword'] : null;

        $this->description      = (isset($data['description'])) ? $data['description'] : null;
        $this->detail           = (isset($data['detail'])) ? $data['detail'] : null;
        $this->viewed           = (isset($data['viewed'])) ? $data['viewed'] : null;
        $this->date_created     = (isset($data['date_created'])) ? $data['date_created'] : null;
        $this->status           = (isset($data['status'])) ? $data['status'] : null;

        $this->position         = (isset($data['position'])) ? $data['position'] : null;
        $this->home             = (isset($data['home'])) ? $data['home'] : null;
        $this->properties       = (isset($data['properties'])) ? unserialize($data['properties']) : null;

    }    
    // Add the following method:
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}
?>