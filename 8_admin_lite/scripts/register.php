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
  if (!isset($_POST['terms'])){
    $_SESSION['error'] = "Zatwierdż regulamin";
    header('location: ../pages/register.php');
    exit();
  }
  if ($_POST['email']!=$_POST['email1']){
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
$stmt->bind_param("sssssss", $_POST['email'], $_POST['city_id'], $_POST['name'], $_POST['surname'], $_POST['birthday'], $_POST['gender'], $pass);

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
