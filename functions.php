<?php
require_once("config.php");


if(isset($_POST['action']) && $_POST['action'] != ''){
    switch ($_POST['action']) {
        case 'post':
            submitWallPost($_POST);
            break;

        case 'like':
            submitPostLike($_POST);
            break;

        case 'dislike':
            submitPostDisLike($_POST);
            break;

        case 'comment':
            submitPostComment($_POST);
            break;
        
        default:
            return false;
            break;
    }
}

function submitPostLike($Data){
    $user_id = $_SESSION['user_id'];
    $post_id = $Data['post_id'];
    $date_created = date("Y-m-d H:i:s");

    $result = mysql_query("INSERT into fb_post_likes(post_id,user_id,like_date) values('$post_id','$user_id','$date_created')");

    if($result){
        mysql_query("UPDATE fb_post set total_like = total_like + 1 where post_id = '$post_id'");
        $Return = array();
        $Return['ResponseCode'] = 200;
        $Return['Message'] = "like successfully.";
    }else{
        $Return = array();
        $Return['ResponseCode'] = 511;
        $Return['Message'] = "Error : Please try again!";
    }

    echo json_encode($Return);
}

function submitPostDisLike($Data){
    $user_id = $_SESSION['user_id'];
    $post_id = $Data['post_id'];

    $result = mysql_query("DELETE from fb_post_likes where user_id = '$user_id' and post_id = '$post_id'");

    if($result){
        mysql_query("UPDATE fb_post set total_like = total_like - 1 where post_id = '$post_id'");
        $Return = array();
        $Return['ResponseCode'] = 200;
        $Return['Message'] = "dislike successfully.";
    }else{
        $Return = array();
        $Return['ResponseCode'] = 511;
        $Return['Message'] = "Error : Please try again!";
    }

    echo json_encode($Return);
}

function submitPostComment($Data){
    $user_id = $_SESSION['user_id'];
    $post_id = $Data['post_id'];
    $comment = $Data['comment'];
    $date_created = date("Y-m-d H:i:s");

    $result = mysql_query("INSERT into fb_comment(post_id,user_id,comment,comment_date) values('$post_id','$user_id','$comment','$date_created')");

    if($result){
        $Return = array();
        $Return['ResponseCode'] = 200;
        $Return['Message'] = "comment submitted successfully.";
    }else{
        $Return = array();
        $Return['ResponseCode'] = 511;
        $Return['Message'] = "Error : Please try again!";
    }

    echo json_encode($Return);
}

function submitWallPost($Data){
    $user_id = $_SESSION['user_id'];
    $content = $Data['post_feed'];
    $date_created = date("Y-m-d H:i:s");

    $result = mysql_query("INSERT into fb_post(user_id,content,total_like,date_created) values('$user_id','$content',0,'$date_created')");

    if($result){
        $Return = array();
        $Return['ResponseCode'] = 200;
        $Return['Message'] = "post updated successfully.";
    }else{
        $Return = array();
        $Return['ResponseCode'] = 511;
        $Return['Message'] = "Error : Please try again!";
    }

    echo json_encode($Return);
}

function getUserDetails($user_id){
    $user_query = mysql_query("select * from fb_users where user_id = '".$user_id."'");
    $userInfo = mysql_fetch_assoc($user_query);

    return $userInfo;
}

function getWallPost(){
    $user_id = $_SESSION['user_id'];
    $wall_query = mysql_query("SELECT p.*,u.name as username, pl.like_id from fb_post p left join fb_users u on u.user_id = p.user_id left join fb_post_likes pl on pl.post_id = p.post_id and pl.user_id = '$user_id' group by p.post_id order by post_id desc");
    $postInfo = array();
    while($row = mysql_fetch_assoc($wall_query)){
        $postInfo[] = $row;
    }
    return $postInfo;
}

function getPostComments($post_id){
    $comment_query = mysql_query("SELECT c.*,u.name as username from fb_comment c left join fb_users u on u.user_id = c.user_id where c.post_id = '$post_id' order by c.comment_id desc");
    $commentInfo = array();
    while($row = mysql_fetch_assoc($comment_query)){
        $commentInfo[] = $row;
    }
    return $commentInfo;
}
?>