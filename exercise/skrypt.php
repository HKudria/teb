<?php
if(!empty($_POST)){
  $a = $_POST['a'];
  $b = $_POST['b'];

if($a < 0 || $b < 0){
  echo "Wypelni wszystkie dane prawidłowo";
} else {
  $ab = $a*$b;
  $obwod = 2*($a+$b);
  echo "Twoj prostokąt " , $a ," i ", $b;
  echo "<br>Pole : ", $ab, " cm2<br>";
  echo "Obwód: ", $obwod, " cm<br>";
}
}
 ?>
