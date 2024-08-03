<?php
    require_once("../inc/verify_login.php");
    require_once("../inc/verify_input.php");
    require_once("../inc/connection.php");

    $sql = 'insert into subject (courseid,title,rate) value(?,?,?)';

    $cmd = $db->prepare($sql);
    extract($_POST);
    $data = array($courseid,$title,$rate);

    $cmd->execute($data);
    $msg = "subject Added successfully";
    header("Location:../subject.php?success=$msg");
?>