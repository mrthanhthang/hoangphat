<?php
namespace Admin\Model;

class User
{
    public $id;
    public $name;
    public $username;
    public $password;

    public function exchangeArray($data)
    {
        $this->id            = (isset($data['id'])) ? $data['id'] : null;
        $this->name          = (isset($data['name'])) ? $data['name'] : null;
        $this->username      = (isset($data['username'])) ? $data['username'] : null;
        $this->password      = (isset($data['password'])) ? $data['password'] : null;
    }
    
    // Add the following method:
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}

?>