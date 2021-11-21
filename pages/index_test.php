<?php
session_start();
require_once('./script/connect.php');


echo <<< AUTORIZATION
<form action="login.php" method="post">
  Login: <input type="text" name="login" placeholder="Podaj login"><br>
  Hasło: <input type="text" name="pass" placeholder="Podaj haslo"><br>
  <input type="submit" value="Zalogój się"><br>
</form>
<a href="./register.php">Rejestracja</a>
AUTORIZATION;
 ?>
