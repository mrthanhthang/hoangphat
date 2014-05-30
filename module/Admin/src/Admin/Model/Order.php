<?php
namespace Admin\Model;

class Order
{
    public $id;
    public $date_order;
    public $order_name;
    public $order_email;
    public $order_phone;
    public $order_address;

    public function exchangeArray($data)
    {
        $this->id               = (isset($data['id'])) ? $data['id'] : null;
        $this->date_order       = (isset($data['date_order'])) ? $data['date_order'] : null;
        $this->order_name       = (isset($data['order_name'])) ? $data['order_name'] : null;
        $this->order_email      = (isset($data['order_email'])) ? $data['order_email'] : null;
        $this->order_phone      = (isset($data['order_phone'])) ? $data['order_phone'] : null;
        $this->order_address    = (isset($data['order_address'])) ? $data['order_address'] : null;
    }
    
    // Add the following method:
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}

?>