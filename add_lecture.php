<?php
require_once('inc/verify_login.php');
require_once('inc/header-part.php');
require_once('inc/connection.php');
?>
</head>

<body>
    <?php require_once('inc/menu.php'); ?>
    <div class="heading">
        <div>
            <span>Lecture -> Add Lecture</span>
            <span><a href="lecture.php">BACK</a></span>
        </div>
    </div>
    <div class="container white-form">
        <form action="submit/insert_lecture.php" method="post">
            <table id="input-table">
                <tr>
                    <td width='33%'>Teacher ID</td>
                    <td>
                        <select name="teacherid" id="teacherid" required>
                            <option value="">Select Teacher</option>
                            <?php
                                $sql = "select name,id from teacher order by name";
                                $cmd = $db->prepare($sql);
                                $cmd->execute();
                                $table = $cmd->fetchAll();
                                
                                foreach($table as $row)
                                {
                                    extract($row);
                            ?>
                                <option value="<?= $id ?>"><?= $name ?></option>
                            <?php
                                }
                            ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Batch ID</td>
                    <td>
                    <select name="batchid" id="batchid" required>
                            <option value="">Select Batch</option>
                            <?php
                            $sql = "select id,classtime from batch order by classtime";
                            $cmd = $db->prepare($sql);
                            $cmd->execute();
                            $table = $cmd->fetchAll();
                            foreach ($table as $row) {
                                echo "<option value={$row['id']}>{$row['classtime']}</option>";
                            }
                            ?>
                        </select>
                    </td>
                <tr>
                    <td>Subject ID</td>
                    <td id="output">
                        <select name="subjectid" id="subjectid" required>
                            <option value="">Select Subject</option>
                            
                        </select>
                    </td>
                </tr>
                </tr>
                <tr>
                    <td>Duration (Minutes)</td>
                    <td>
                        <input type="number" name="duration" id="duration" class="input-box" required min="30" max="240" />
                    </td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td>
                        <input type="number" name="amount" id="amount" class="input-box" required min='0' />
                    </td>
                </tr>
                <tr>
                    <td>Lecture Date</td>
                    <td>
                        <input type="date" name="lecturedate" id="lecturedate" class="input-box" required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button name="submit" type="submit" class="save">
                            <i class="fa fa-save"></i> Save
                        </button>
                        <button type="reset" class="clear">
                            <i class="fa fa-trash"></i> Clear All
                        </button>
                    </td>
                </tr>
                <tr>
                    <td colspan='2'>
                        <?php require_once("inc/message.php") ?>
                    </td>
                </tr>
            </table>
        </form>

    </div>
    <script src="inc/jquery-min.js"></script>
    <script>
        $(document).ready(function(){
           $("#batchid").change(function(){
                
                let ajaxurl = "ajax/getsubject.php?batchid=" + $(this).val();
                
                $.get(ajaxurl,function(data,status){
                    $("#output").html(data);
                });
           });
        });
    </script>
</body>
<?php
require_once('inc/footer.php');
?>