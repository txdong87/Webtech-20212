<html>
	<head><title>Receive Input</title></head>
	<body>
		<?php
        $name=$_POST["name"];
        $class=$_POST["class"];
        $university=$_POST["university"];
        $hobby1=isset($_POST["hobby1"]);
        $hobby2=isset($_POST["hobby2"]);
        $hobby3=isset($_POST["hobby3"]);
        $hobby=isset($_POST["hobby"]);
        print("<br> Your name is $name");
        print("<br> Your class is $class");
        print("<br> Your university is $university<br>");
        
        if($hobby1)echo "So thich ban la Nghe nhac";
        if($hobby2)echo "So thich ban la Doc sach";
        if($hobby3)echo "So thich ban la Ngu";
        if($hobby)echo "So thich ban la $hobby";

        ?>
     </body>
</html>

