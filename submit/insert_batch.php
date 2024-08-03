<?php
    require_once("../inc/verify_login.php");
    require_once("../inc/verify_input.php");
    require_once("../inc/connection.php");

    $sql = 'insert into batch (courseid,startdate,enddate,classtime) value(?,?,?,?)';

    $cmd = $db->prepare($sql);

    $cmd->bindparam(1,$_POST['courseid']);
    $cmd->bindparam(2,$_POST['startdate']);
    $cmd->bindparam(3,$_POST['enddate']);
    $cmd->bindparam(4,$_POST['classtime']);

    $cmd->execute();

    $msg="Batch Added";
    header("location:../batch.php?success=$msg");
?>