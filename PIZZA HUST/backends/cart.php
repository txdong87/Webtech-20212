<?php

session_start();

try {

    if (!file_exists('connection-pdo.php' ))
        throw new Exception();
    else
        require_once('connection-pdo.php' ); 
		
} catch (Exception $e) {

	$arr = array ('code'=>"0",'msg'=>"There were some problem in the Server! Try after some time!");

	echo json_encode($arr);

	exit();
	
}

if (!isset($_SESSION['user']) || !isset($_SESSION['user_id'])) {
	$_SESSION['msg'] = "You must Log In First to Order Food!";
	header('location: ../foods.php');
	exit();
}

if (!isset($_REQUEST['id'])) {
	$_SESSION['msg'] = "Invalid food item! Please try again!";
	header('location: ../foods.php');
	exit();
}

date_default_timezone_set("Asia/Ho_Chi_Minh");
$food_id = $_SESSION['food_id'];

$id = $_SESSION['id'];

$quantity = $_SESSION['quantity'];

$updateTime = date("d:m:Y h:i:sa");


$sql = "INSERT INTO cart_item(food_id,id,quantity, updateTime) VALUES(?,?,?,?)";

$query  = $pdoconn->prepare($sql);

if ($query->execute([ $food_id, $id, $quantity,$updateTime])) {

	$_SESSION['msg'] = 'Order Placed! Your Order ID is : '.$id;

	header('location: ../foods.php');
	
} else {

	$_SESSION['msg'] = 'There were some problem in the server! Please try again after some time!';

	header('location: ../foods.php');

}