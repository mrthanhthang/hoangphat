<?php
namespace Admin\Model;

class Item
{
    public $id;
    public $name;
    public $category_id;
    public $description;
    public $arr_images;
    public $date_create;
    public $is_active;
    public $price;
    public $discount_percent;
	public $view;

    public function exchangeArray($data)
    {
        $this->id                   = (isset($data['id'])) ? $data['id'] : null;
        $this->name                 = (isset($data['name'])) ? $data['name'] : null;
        $this->category_id          = (isset($data['category_id'])) ? $data['category_id'] : null;
        $this->description          = (isset($data['description'])) ? $data['description'] : null;
        $this->arr_images           = (isset($data['arr_images'])) ? $data['arr_images'] : null;
        $this->date_create          = (isset($data['date_create'])) ? $data['date_create'] : null;
        $this->is_active            = (isset($data['is_active'])) ? $data['is_active'] : null;
        $this->price                = (isset($data['price'])) ? $data['price'] : null;
        $this->discount_percent     = (isset($data['discount_percent'])) ? $data['discount_percent'] : null;
        $this->view                 = (isset($data['view'])) ? $data['view'] : null;
    }
    
    // Add the following method:
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}

?>