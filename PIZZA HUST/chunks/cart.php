<?php

require('backends/connection-pdo.php');

$sql = 'SELECT * FROM orders';

$query  = $pdoconn->prepare($sql);
$query->execute();
$arr_all = $query->fetchAll(PDO::FETCH_ASSOC);
?>
<?php
// If the user clicked the add to cart button on the product page we can check for the form data
if (isset($_POST['food_id']) && is_numeric($_POST['product_id']) ) {
    // Set the post variables so we easily identify them, also make sure they are integer
    $food_id = (int)$_POST['food_id'];
    // Prepare the SQL statement, we basically are checking if the product exists in our databaser
    $stmt = $pdo->prepare('SELECT * FROM food WHERE id = ?');
    $stmt->execute([$_POST['food_id']]);
    // Fetch the product from the database and return the result as an Array
    $food = $stmt->fetch(PDO::FETCH_ASSOC);
    // Check if the product exists (array is not empty
    // Prevent form resubmission...
    header('location: navbar.php');
    exit;
}?>
<table class="table table-striped">
  <thead class="thead-light">
    <tr>
      <th scope="col">Item</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td><?php echo $arr_all[$i+$j-2]['fname']; ?></td>
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
<h1>Product List</h1> 
<table class="table table-striped">
  <thead class="thead-light">
	    <tr> 
	        <th scope="col">Name</th> 
	        <th scope="col">Description</th> 
	        <th scope="col">Price</th> 
	        <th scope="col">Action</th> 
	    </tr> 
	    <tr> 
	        <td>Product 1</td> 
	        <td>Some random description</td> 
	        <td>15 $</th> 
	        <td><a href="#">Add to cart</a></td> 
	    </tr> 
	     <tr> 
	        <td>Product 2</td> 
	        <td>Some random description</td> 
	        <td>25 $</th> 
	        <td><a href="#">Add to cart</a></td> 
	    </tr> 
	</table>