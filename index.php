<?php
include_once("header.php");

if(isset($_SESSION['user_id']) && $_SESSION['user_id'] != ""){
    header("location:wall.php");
}

if(isset($_POST['submit']) && $_POST['submit'] == "Login"){
    $_SESSION['user_id'] = $_POST['user'];
    header("location:wall.php");
}

$query = mysql_query("select * from fb_users");
?>
<div class="wrapper">
    <div class="middle_box">
        <form method="post">      
            <div class="row_ele"> 
                <label>Select User</label>
                <select name="user" id="user" class="user_select">
                    <?php while($rowData = mysql_fetch_assoc($query)) { ?>
                        <option value="<?php echo $rowData['user_id']; ?>"><?php echo $rowData['name']; ?></option>
                    <?php } ?>
                </select>
            </div>  
            <div class="row_ele mar_top_20">
                <label>&nbsp;</label>
                <input class="btn" type="submit" name="submit" value="Login"/>
            </div>
        </form>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>
<?php
include_once("footer.php");
?>