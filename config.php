<?php
mysql_connect("localhost","root","");
mysql_select_db("facebook_wall");

define("SITE_URL","http://" . $_SERVER['SERVER_NAME']."/facebook_wall");
session_start();
?>