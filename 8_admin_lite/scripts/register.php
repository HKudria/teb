<?php
session_start();
//swrawdzenia wypelnenia wsztkich pólegal
if(!empty($_POST)){
  $error = 0;
  foreach ($_POST as $key => $value) {

    if(empty($value)){
      if($key == "gender") continue;
      $_SESSION['error'] = "Nie wypelnilesz wszystkiego";
      header('location: ../pages/register.php');
      exit();
    }
    $_SESSION['form_date'][$key]=$value;
  }
  //regex imię
  //if (preg_match("/^[a-zzżźćńółęąśŻŹĆĄŚĘŁÓŃ]{2,12}$/i", $_POST['name'] = trim($_POST['name']))){

  require_once '../functions/regex.php';


  if(stringRegex($_POST['name'])){
    $name = stringRegex($_POST['name']);
  } else {
    $error = 1;
  }

  if(stringRegex($_POST['surname'],'surname')){
    $surname = stringRegex($_POST['surname'],'surname');
  } else {
    $error = 1;
  }

  if (!isset($_POST['terms'])){
    $_SESSION['error'] = "Zatwierdź regulamin";
    header('location: ../pages/register.php');
    exit();
  }

  if(stringRegex($_POST['email'],'email')){
    $email = stringRegex($_POST['email'],'email');
  } else {
    $error = 1;
  }

  if ($email!=stringRegex($_POST['email1'],'email')){
    $_SESSION['error'] = "email nie są takie same";
    $error = 1;
  }

  if ($_POST['password']!=$_POST['password1']){
    $_SESSION['error'] = "hasla są różne";
    $error = 1;
  }


if ($error==1){
  header('location: ../pages/register.php');
  exit();
}
  $pass = password_hash($_POST['password'], PASSWORD_DEFAULT);
//echo $pass;

//dodawanie użytkownika do bazy
require_once './connect.php';
$sql = "INSERT INTO `users` (`email`, `city_id`, `name`, `surname`, `birthday`, `gender`, `password`) VALUES (?, ?, ?, ?, ?, ?, ?);";
$stmt = $db->prepare($sql);
$stmt->bind_param("sssssss", $email, $_POST['city_id'], $name, $surname, $_POST['birthday'], $_POST['gender'], $pass);

// echo "<pre>";
// print_r($_POST);
// echo "</pre>";
}

if($stmt->execute()){
  $_SESSION['error']['succes'] = "Prawidlowo dodano użytkownia";
  header('location: ../');
} else {
  $_SESSION['error'] = "Nie dodano użytkownika";
  header('location: ../pages/register.php');
}
 ?>
