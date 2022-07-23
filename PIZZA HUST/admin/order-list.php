<?php require('layout/header.php'); ?>
<?php require('layout/left-sidebar-long.php'); ?>
<?php require('layout/topnav.php'); ?>
<?php require('layout/left-sidebar-short.php'); ?>


<?php

require('../backends/connection-pdo.php');


//$sql = 'SELECT * FROM orders LEFT JOIN food ON orders.food_id = food.id  ORDER BY(orders.timestamp)DESC' ;
$sql="SELECT * FROM orders";
$query = $pdoconn->prepare($sql);
$query->execute();
$arr_all = $query->fetchAll(PDO::FETCH_ASSOC);



?>
						

<div class="section white-text" style="background: #B35458;">

	<div class="section">
		<h3>Orders</h3>
	</div>

  <?php

    if (isset($_SESSION['msg'])) {
        echo '<div class="section center" style="margin: 5px 35px;"><div class="row" style="background: red; color: white;">
        <div class="col s12">
            <h6>'.$_SESSION['msg'].'</h6>
            </div>
        </div></div>';
        unset($_SESSION['msg']);
    }

    ?>
	
	<div class="section center" style="padding: 20px;">
		<table class="centered responsive-table">
        <thead>
          <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Address</th>
              <th>Phone</th>
              <th>Timestamp</th>
              <th></th>
          </tr>
        </thead>

        <tbody>
          <?php

            foreach ($arr_all as $key) {

          ?>
          <tr>
            <td><?php echo $key['name']; ?></td>
            <td><?php echo $key['email']; ?></td>
            <td><?php echo $key['address']; ?></td>
            <td><?php echo $key['phone']; ?></td>
            <td><?php echo $key['timestamp']; ?></td>
            <td><a href="order-detail.php?id=<?php echo $key['id']?>"  >Xem chi tiết</a></td>
          </tr>

          <?php } ?>
         
        </tbody>
      </table>
	</div>
</div>


<?php require('layout/footer.php'); ?>