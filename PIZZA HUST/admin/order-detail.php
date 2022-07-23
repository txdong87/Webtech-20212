<?php require('layout/header.php'); ?>
<?php require('layout/left-sidebar-long.php'); ?>
<?php require('layout/topnav.php'); ?>
<?php require('layout/left-sidebar-short.php'); ?>
<?php include('../cart-function.php')?>

<?php

require('../backends/connection-pdo.php');

if(isset($_GET['id'])){
    $id_order=$_GET['id'];
    $sqlDetail="SELECT order_detail.order_id, order_detail.food_id,order_detail.quantity,order_detail.price,order_detail.createAt ,food.fname FROM order_detail 
                INNER JOIN orders ON order_detail.order_id=orders.id 
                INNER JOIN food ON order_detail.food_id=food.id
                WHERE order_detail.order_id= $id_order";
    $query = $pdoconn->prepare($sqlDetail);
$query->execute();
$arr_all = $query->fetchAll(PDO::FETCH_ASSOC);
}
?>
<div class="section white-text" style="background: #B35458;">

<div class="section">
    <h3>Order Detail</h3>
</div>
<div class="section center" style="padding: 20px;">
		<table class="centered responsive-table">
        <thead>
          <tr>
              <th>STT</th>
              <th>Tên sản phẩm</th>
              <th>Số lượng</th>
              <th>Giá</th>
              <th>Thành tiền</th>
              <th>Ngày tạo</th>
          </tr>
        </thead>

        <tbody>
          <?php

            foreach ($arr_all as $key=>$value) {
              $total=(int)$value["quantity"]*(int)$value["price"];
          ?>
          <tr>
            <td><?php echo $key=1 ?></td>
            <td><?php echo $value['fname']; ?></td>
            <td><?php echo $value['quantity']; ?></td>
            <td><?php echo $value['price']; ?></td>
            <td><?php echo $total ;?></td>
            <td><?php echo $value['createAt'];?></td>
            

          </tr>
          
          <?php ; } ?>
         
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td >SUB TOTAL :</td>
            <td class="sub-total" colspan="1"><?php echo subtotal($arr_all) ?>  VND</td>
          </tr>
        </tbody>
        
   

      </table>
	</div>
</div>
