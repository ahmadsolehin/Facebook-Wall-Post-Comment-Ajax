<?php
require_once("functions.php");

if(isset($_SESSION['user_id']) && $_SESSION['user_id'] != ""){
	
	$userInfo = getUserDetails($_SESSION['user_id']);
}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Facebook Wall Post</title>

	<!-- Include CSS file -->
	<link href="<?php echo SITE_URL; ?>/style.css" rel="stylesheet" type="text/css" />
	
	<!-- Include jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
</head>
	<body>
	    <div class="header">
	        <div class="container">
	            <p class="head_user">
	                <?php
	                if(isset($_SESSION['user_id']) && $_SESSION['user_id'] != ""){ ?>	
	                	Welcome , <?php echo $userInfo['name']; ?>                
	                    <a class="logout" href="<?php echo SITE_URL; ?>/logout.php">Logout</a>
	                <?php } ?>
	            </p>
	        </div>
	    </div>
	    <div class="container">