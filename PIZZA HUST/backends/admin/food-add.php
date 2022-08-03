<?php


session_start();
try {

    if (!file_exists('../connection-pdo.php' ))
        throw new Exception();
    else
        require_once('../connection-pdo.php' ); 
		
} catch (Exception $e) {

	$_SESSION['msg'] = 'There were some problem in the Server! Try after some time!';

	header('location: ../../admin/food-list.php');

	exit();
	
}

if (!isset($_POST['name']) || !isset($_POST['desc'])) {

	$_SESSION['msg'] = 'Invalid POST variable keys! Refresh the page!';

	header('location: ../../admin/food-list.php');

	exit();
}

 else {

	$name = $_POST['name'];
	$desc = $_POST['desc'];
	$category = $_POST['category'];
	$price=$_POST['price'];
	$img=$_POST['img'];
	$sql = "INSERT INTO food(cat_id,fname,price,description,imageUrl) VALUES(?,?,?,?,?)";
	echo $sql;
    $query  = $pdoconn->prepare($sql);
    if ($query->execute([$category, $name,$price ,$desc,$img])) {

    	$_SESSION['msg'] = 'Food Added!';

		header('location: ../../admin/food-list.php');
    	
    } else {

    	$_SESSION['msg'] = 'There were some problem in the server! Please try again after some time!';

		header('location: ../../admin/food-list.php');

    }


}