<?php

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
			'fname' => $cart[$id]["name"],
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
if (isset($_POST['id']) ) {
    $id=$_POST['id'];
    $sqlselect='SELECT * FROM food WHERE id = '.$id;
    $query  = $pdoconn->prepare($sqlselect);
    $query->execute();
    $row = $query->fetch(PDO::FETCH_ASSOC);
    print_r($row);
    if(!isset($_SESSION["cart"])){
		$cart[$id]=array(
			'fname' => $row["fname"],
			'price'=>$row["price"],
      'number'=>1,
		);
    }else{     
      $cart=$_SESSION["cart"];
      if(array_key_exists($id,$cart)){
        $cart[$id]=array(
          'fname' => $row["fname"],
          'price'=>$row["price"],
          'number'=> (int)$cart[$id]['number']+1,
        );
      }else{
        $cart[$id]=array(
          'fname' => $row["fname"],
          'price'=>$row["price"],
          'number'=>1
        );
      }
    }
  $_SESSION["cart"]=$cart;
  $number=0;
  $total=0;
  foreach($cart as $values){
    $number+=(int)$values["number"];
    $total+=(int)$values["number"]*(int)$values["price"];
  }
  echo $number. "-". $total;
  echo"<prE>";
  print_r($_SESSION["cart"]);
exit;
}?>

  <div class="container">
    <div class="row">
      <div class="col-md-12 col-sm-6">
	       <table class="table table-striped"id="listCart">
           <thead class="thead-light">
    <tr>                                                                                                         
      <th scope="col">Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total</th>
    </tr>
  </thead>
<?php if(isset($_SESSION["cart"])){
  $cart=$_SESSION["cart"];
  $total=0;
  $subtotal=0;
$number=0;
  foreach($cart as $key=>$values){
 
?>
  <tbody>
    <tr>
      <td class="details"><?php echo $values["fname"]?> </td>
      <td class="price-center"><?php echo $values["price"]?></td> 
      <td class="qty text-center"><input class="input" type="number" value="<?php echo $values["number"]?>" id="num_<?php echo $key;?>" onclick="updateCart(<?php echo $key?>)"></td>
      <td class="total text-center"><strong class="primary-color"><?php 
      $total=(int)$values["number"]*(int)$values["price"];
      $subtotal+=$total;
      echo number_format($total,0,",",".") ;
      ?>
      </td>
    </tr>
    <?php }} ?>
  </tbody>
  <tfoot>
    <tr>
      <th class="empty" colspan="2"></th>
      <th>SUB TOTAL</th>
      <th class="sub-total" colspan="1"><?php echo $subtotal ?>  VND</th>
    </tr>
  </tfoot>
</table>
<div class="bottom-wrap" >
  
<a class="btn btn-secondary float-center" href="foods.php" role="button">Shopping </a>

				<a href="checkout.php" class="btn  btn-secondary btn-hover float-left" data-abc="true"> Buy now </a>
</div>
				
			</div> 
      </div></div></div>
