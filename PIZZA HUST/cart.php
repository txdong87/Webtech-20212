<?php

require('backends/connection-pdo.php');

?>
<?php
// If the user clicked the add to cart button on the product page we can check for the form data
if (isset($_POST['id']) ) {
  $id=$_POST['id'];
   $sqlselect='SELECT * FROM food WHERE id = '.$id;
   $query  = $pdoconn->prepare($sqlselect);
    $query->execute();
    $row = $query->fetchAll(PDO::FETCH_ASSOC);
    if(!isset($_SESSION["cart"])){
		$cart[$id]=array(
			'name' => $row['fname'],
			'price'=>$row[3],
		);
	}
    print_r($cart);
	print_r($row);
    exit;
}?>
<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title> Cart!</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<!-- <meta http-equiv="refresh" content="1"> -->

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Bree+Serif&display=swap" rel="stylesheet">


	<link rel="stylesheet" href="css/all-style.css">

	<link rel="stylesheet" href="css/style.css">

	
</head>
<body>

	<?php require('chunks/login-modal.php'); ?>


	<?php require('chunks/register-modal.php'); ?>





	<?php require('chunks/navbar.php'); ?>


	<?php require('chunks/banner-slider.php'); ?>
	
	<table class="table table-striped">
  <thead class="thead-light">
    <tr>                                                                                                         k
      <th scope="col">Item</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">{</th>
      <td></td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>

	<?php require('chunks/footer.php'); ?>



	<script
	  src="https://code.jquery.com/jquery-3.4.1.min.js"
	  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  crossorigin="anonymous"></script>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script src="js/loaders.js"></script>
    <script src="js/ajax.js"></script>
</body>
</html>