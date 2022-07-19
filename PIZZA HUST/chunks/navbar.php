<section class="fnavbar">
		<div class="navbar-fixed">
		<nav>
		    <div class="nav-wrapper">
		      <a href="#" class="brand-logo">PIZZA HUST</a>
		      <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
		      <ul class="right hide-on-med-and-down">
		        <li><a href="index.php" class="hvr-grow">Home</a></li>
		        <li><a href="food-categories.php" class="hvr-grow">Categories</a></li>
		        <li><a href="foods.php" class="hvr-grow">Foods</a></li>
				<li><a href="cart.php" class="hvr-grow">Cart</a></li>
		        <?php

		        	if (isset($_SESSION['user'])) {
		        		echo '<li><a href="#" class="hvr-grow">Hi, '.$_SESSION['user'].'</a></li>
		        		<li><a href="logout.php" class="hvr-grow">Logout</a></li>';
		        	} else {
		        		echo '<li><a href="#" class="hvr-grow modal-trigger" data-target="modal1">Login</a></li>
		        		<li><a href="#" class="hvr-grow modal-trigger" data-target="modal2">Register</a></li>';
		        	}

		        ?>
		        
		      </ul>
		    </div>
		  </nav>
		</div>

		  <ul class="sidenav" id="mobile-demo">
		    <li><a href="index.php">Home</a></li>
	        <li><a href="food-categories.php">Categories</a></li>
	        <li><a href="foods.php">Foods</a></li>
			<li><a href="cart.php" class="hvr-grow">Cart</a></li>	
	        <?php

		        	if (isset($_SESSION['user'])) {
		        		echo '<li><a href="#">Hi, '.$_SESSION['user'].'</a></li>
		        		<li><a href="logout.php">Logout</a></li>';
		        	} else {
		        		echo '<li><a href="" class="modal-trigger" data-target="modal1">Login</a></li>
		        		<li><a href="" class="modal-trigger" data-target="modal2">Register</a></li>';
		        	}

		        ?>
		  </ul>
	</section>