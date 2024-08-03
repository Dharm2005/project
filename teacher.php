<?php
    require_once('inc/verify_login.php');
    require_once('inc/header-part.php');
    require_once('inc/connection.php');
?>
<link rel="stylesheet" href="dist/css/lightbox.min.css">
</head>

<body>
    <?php require_once('inc/menu.php'); ?>
    <div class="heading">
        <div>
            <span>Teacher</span>
            <span><a href="add_teacher.php">Add Teacher</a></span>
        </div>
    </div>
    <div class="container">
        <table align="center" class="data">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Photo</th>
                    <th>Mobile <br>
                        Email
                    </th>
                    <th>Gender</th>
                    <th>Qualification</th>
                    <th>Experience</th>
                    </th>
                    <th width='8%'>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $sql = "select * from teacher where isdeleted=0 order by id desc";
                    $cmd = $db->prepare($sql);
                    $cmd->execute();

                    $table = $cmd->fetchAll();

                    foreach ($table as $row) 
                    {
                        extract($row);
                    ?>
                <tr>
                    <td><?= $id; ?></td>
                    <td><?= $name; ?></td>
                    <td>
                        <a class="example-image-link" href="images/<?= $photo; ?>" data-lightbox="example-1">
                                <img class="example-image" height='100px' src="images/<?= $photo; ?>" alt="">
                            </a>
                    </td>
                    <td><?= $mobile; ?><br/>
                    <?= $email; ?>
                    </td>
                    <td><?= $gender; ?></td>
                    <td>
                    <?= $qualification; ?> 
                    </td>
                    <td>
                        <?= $experience ?>
                    </td>
                    <td>
                    <a title='delete course' class='delete'><i class="fa fa-trash fa-2x"></i></a>
                    <a href="edit_teacher.php?teacherid=<?= $id; ?>"> <i class="fa fa-edit fa-2x"></i></a>
                </td>
                </tr>         
                <?php } ?>
            </tbody>
        </table>
    </div>
    <script src="inc/jquery-min.js"></script>
    <script>
        $(document).ready(function(){
            $(".delete").click(function(){
                let choice = confirm("are you sure you want to do this?");
                if (choice === true) {
                    let id = $(this).parent().parent().find('td:first').text();
                    let table = "teacher";
                    let row = $(this).parent().parent();
                    let page = "ajax/delete_row.php";
                    var data = {
                    rowid: id,
                    tablename: table
                    };
                    $.post(page,data,function(response){
                        console.log(response);
                        $(row).fadeOut(1000,function(){
                            $(this).remove();
                        })
                    }
                ).fail(function(){
                    alert('error ocuured....');
                });
                }
            });
        });
    </script>
</body>