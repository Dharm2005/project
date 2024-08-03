<?php
    require_once('../inc/connection.php');
    extract($_POST);
    $sql = "UPDATE course SET title=?,fees=?,duration=?,description=? WHERE id=?";
    $cmd = $db->prepare($sql);
    $cmd->bindParam(1,$title);
    $cmd->bindParam(2,$fees);
    $cmd->bindParam(3,$duration);
    $cmd->bindParam(4,$description);
    $cmd->bindParam(5,$courseid);
    $cmd->execute();
    $msg = "Course detail updated successfully";
    header("Location:../course.php?success=$msg");
?>
?>