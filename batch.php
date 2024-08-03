<?php
    require_once('inc/verify_login.php');
    require_once('inc/connection.php');
    require_once('inc/header-part.php');
    require_once('inc/datetime_function.php');
?>
</head>
<body>
    <?php require_once('inc/menu.php'); ?>
    <div class="heading">
        <div>
            <span>Batch</span>
            <span><a href="add_batch.php">Add batch</a></span>
        </div>
    </div>
    <div class="container">
        <?php require_once("inc/message.php"); ?>
        <table align="center" class="data">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Course</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>Class time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $sql = "select b.*,title from batch b,course c where b.isdeleted=0 and c.id=courseid order by b.id desc";
                    $cmd = $db->prepare($sql);
                    $cmd->execute();

                    while($row = $cmd->fetch())
                    {
                ?>
                <tr>
                    <td><?php echo $row['id']?></td>
                    <td><?php echo $row['title']?></td>
                    <td><?php echo toDMY($row['startdate'])?></td>
                    <td><?php echo toDMY($row['enddate'])?></td>
                    <td><?php echo $row['classtime']?></td>
                    <td>
                        <a title='delete course' class='delete'><i class="fa fa-trash fa-2x"></i></a>
                        <a href=""><i class="fa fa-edit fa-2x"></i></a>
                    </td>
                </tr>
                <?php
                    }
                ?>
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
                    let table = "batch";
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
<?php
require_once('inc/footer.php');
?>