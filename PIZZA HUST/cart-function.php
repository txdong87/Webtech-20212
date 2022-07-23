<?php
function subtotal($cart){
$subtotal=0;
foreach($cart as $key=>$value){
    $subtotal+=$value['quantity']*$value['price'];
}
return $subtotal;
}