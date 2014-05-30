<?php
namespace Admin\Model;

class OrderDetail
{
    public $id;
    public $order_id;
    public $itemt_id;
    public $quantity;

    public function exchangeArray($data)
    {
        $this->id            = (isset($data['id'])) ? $data['id'] : null;
        $this->order_id      = (isset($data['order_id'])) ? $data['order_id'] : null;
        $this->itemt_id      = (isset($data['itemt_id'])) ? $data['itemt_id'] : null;
        $this->quantity      = (isset($data['quantity'])) ? $data['quantity'] : null;
    }
    
    // Add the following method:
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}

?>