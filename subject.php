<?php
    require_once('inc/verify_login.php');
    require_once('inc/header-part.php');
    require_once('inc/connection.php');
?>
</head>

<body>
    <?php
        require_once('inc/menu.php');
    ?>
    <div class="heading">
        <div>
            <span>Subject</span>
            <span><a href="add_subject.php">Add Subject</a></span>
        </div>
    </div>
    <div class="container">
        <?php require_once("inc/message.php"); ?>
        <table align="center" class="data">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Course</th>
                    <th>Title</th>
                    <th>Rate</th>
                    <th while='10%'>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php   
                    $sql = "select s.*,c.title as course from subject s,course c where s.isdeleted=0 and courseid=c.id order by s.id desc";
                    $cmd = $db->prepare($sql);
                    $cmd->execute();

                    $table = $cmd->fetchAll();

                    foreach($table as $row)
                    {
                ?>
            <tr>
                <td><?= $row['id'] ?></td>
                <td><?= $row['course'] ?></td>
                <td><?= $row['title'] ?></td>
                <td><?= $row['rate'] ?></td>
                <td>
                    <a title='delete course' class='delete'><i class="fa fa-trash fa-2x"></i></a>
                    <a href=""><i class="fa fa-edit fa-2x"></i></a>
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
                    let table = "subject";
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