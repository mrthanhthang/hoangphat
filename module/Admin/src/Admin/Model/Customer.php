<?php
namespace Admin\Model;

class Customer
{
    public $id;
    public $username;
    public $password;
    public $fullname;
    public $address;    
    public $email;    
    public $tel;
    public $date_created;
    public $type;
    public $status;

    public function exchangeArray($data)
    {
        $this->id               = (isset($data['id'])) ? $data['id'] : null;
        $this->username       = (isset($data['username'])) ? $data['username'] : null;
        $this->password       = (isset($data['password'])) ? $data['password'] : null;
        $this->fullname      = (isset($data['fullname'])) ? $data['fullname'] : null;
        $this->address      = (isset($data['address'])) ? $data['address'] : null;
        $this->email    = (isset($data['email'])) ? $data['email'] : null;
        $this->tel    = (isset($data['tel'])) ? $data['tel'] : null;
        $this->date_created    = (isset($data['date_created'])) ? $data['date_created'] : null;
        $this->type    = (isset($data['type'])) ? $data['type'] : null;
        $this->status    = (isset($data['status'])) ? $data['status'] : null;
    }    
    // Add the following method:
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}

?>