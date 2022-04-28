<!DOCTYPE html>
<html>
	<head><title>Receive Input</title></head>
	<body>
		<?php
        $name=$_POST["name"];
        $class=$_POST["class"];
        $university=$_POST["university"];
        
        print("<br> Your name is : $name");
        print("<br> Your class is : $class");
        print("<br> Your university is : $university<br>");
        ?>
        <?php echo 'Your hobby is:'.'<br>';
        ?>
        <?php
        if(isset($_POST['hobby'])){
            $count = 1;
            foreach($_POST['hobby'] as $value){
                echo $count.'.&nbsp;&nbsp;&nbsp;';
                echo $value.'<br>';
                $count += 1;
            }
        }
        ?>
     </body>
</html>

