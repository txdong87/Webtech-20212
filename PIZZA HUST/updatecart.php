<?php
ob_start();
session_start();
require('backends/connection-pdo.php');
if (isset($_POST['id']) && isset($_POST['num'])) {
    $id=$_POST['id'];
    if(isset($_SESSION["cart"])){
    $cart=$_SESSION["cart"];
    echo "<pre>";
    print_r($cart);
    if(array_key_exists($id,$cart)){
        if($_POST["num"]){
        $cart[$id]=array(
			'fname' => $cart[$id]["fname"],
			'price'=>$cart[$id]["price"],
            'number'=>$_POST['num'],
        );
    }else{
        unset($cart[$id]);
    }
}
    $_SESSION["cart"]=$cart;
    }
}