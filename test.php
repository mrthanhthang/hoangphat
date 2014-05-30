<?php
session_start();
print_r($_SESSION);
echo '<pre>';
print_r($arrCat);
echo '</pre>';  
function Menu($parentid = '', $space = "", $trees = array())
    {        
        if(!$trees)
        {
            $trees = array();
        }
        $sql = "SELECT * FROM `dc_product_categories` WHERE `parent_id` = '$parentid' and `status` = 1 order by `position`";
        $query = mysql_query($sql);
        while($rs = mysql_fetch_assoc($query))
        {           	
            $trees[] = array( 'code' => $rs['code'],
                                'name'=>$space.$rs['name'],
                                );
            $trees = $this -> Menu($rs['code'], $space.'&nbsp;&nbsp;&nbsp;|--', $trees);
            
        }
        return $trees;
    }
 ?>