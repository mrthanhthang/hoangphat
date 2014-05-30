<?php
    define("ADMIN_NUM_PAGE", "10");

    /*Status*/
    define("SET_HOME", "1");
    /*Status*/
    define("DISABLE", "0");
    /*Status*/
    define("ENABLE", "1");


/*============= Status ==========*/
$status = array();
$status['product'][ENABLE]= "<span class='status-enable'>Hiển thị</span>";
$status['product'][DISABLE]= "<span class='status-disable'>Tạm ngưng</span>";


?>