<div class="section">
    <div class="container">
        <div class="row">
        <div class="section white center">
			<h3 class="header">Check out!</h3>
		</div>
            <div class="col s12">
                <form id="checkout-form" class="clear" method="post" action="">
                    <div class="input-field col s12">
                        <input class="input" type="text" name="name" id="name" placeholder="Full Name">
                    </div>
                    <div class="input-field col s12">
                        <input class="input" type="email" name="email" id="email" placeholder="Email">
                    </div>
                    <div class="input-field col s12">
                        <input class="input" type="text" name="address" id="adress" placeholder="Address">
                    </div>
                    <div class="input-field col s12">
                        <input class="input" type="tel" name="phone" id="phone" placeholder="Phone">
                    </div>
                    <button href="cart.php" name="addNew" type="submit" class="btn waves-effect waves-block waves-light" href="cart.php" >Check out</button>
                </form>
                <?php 
 
                if(isset($_POST['addNew'])){
                    $pdoconn = new PDO("mysql:host=localhost; dbname=webtechdb", "root", "");
                $users_id=$_SESSION["user_id"];
                $name=$_POST['name'];
                $email=$_POST['email'];
                $address=$_POST['address'];
                $phone=$_POST['phone'];
                $timestamp=date("Y-m-d H:i:s");
             $sql="INSERT INTO `orders` (`users_id`,`name`,`email`,`address`,`phone`,`timestamp`) VALUES('$users_id','$name','$email','$address','$phone','$timestamp')";
         
               $query  = $pdoconn->prepare($sql);
              $query->execute(array($users_id,$name,$email,$address,$phone,$timestamp)) ;
              $last_id = $pdoconn->lastInsertId();

              if(isset($_SESSION["cart"])){
                    foreach($_SESSION["cart"] as $key => $value){
                        $price=$value["price"];
                        $quantity=$value["number"];
                        $sqlDetail="INSERT INTO `order_detail`(order_id,food_id,quantity,price,createAT) VALUES('$last_id','$key','$quantity','$price',' $timestamp')";
                        $query  = $pdoconn->prepare($sqlDetail);
                        $query->execute(array($last_id,$key,$quantity,$price,$timestamp));
                    }
                   
                }
            
 
            }
            ?>
            </div>
        </div>
    </div>
</div>
