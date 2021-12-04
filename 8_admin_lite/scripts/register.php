<?php
session_start();
//swrawdzenia wypelnenia wsztkich dannych

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


//sprawdzamy imię
  if(stringRegex($_POST['name'])){
    $name = stringRegex($_POST['name']);
  } else {
    $error = 1;
  }

  //sprawdzamy nazwisko
  if(stringRegex($_POST['surname'],'surname')){
    $surname = stringRegex($_POST['surname'],'surname');
  } else {
    $error = 1;
  }

  //sprawdzamy email
  if(stringRegex($_POST['email'],'email')){
    $email = stringRegex($_POST['email'],'email');
  } else {
    $error = 1;
  }

  if ($email!=stringRegex($_POST['email1'],'email')){
    $_SESSION['error'] = "email nie są takie same";
    $error = 1;
  }


  //sprawdzamy haslo
  if(stringRegex($_POST['password'],'password')){
    $pass = stringRegex($_POST['password'],'password');
  } else {
    $error = 1;
  }

  if ($pass!=$_POST['password1']){
    $_SESSION['error'] = "hasla są różne";
    $error = 1;
  }


  //sprawdzamy plec
  if($_POST['gender'] != '0' && $_POST['gender'] != '1'){
    $_SESSION['error'] = "Wypełnij prawidłowo płeć";
    $error = 1;
  }

  if (!isset($_POST['terms'])){
    $_SESSION['error'] = "Zatwierdź regulamin";
    header('location: ../pages/register.php');
    exit();
  }

  if ($error==1){
    header('location: ../pages/register.php');
    exit();
  }
  $pass = password_hash($pass, PASSWORD_DEFAULT);
//echo $pass;

//dodawanie użytkownika do bazy
require_once './connect.php';
$sql = "INSERT INTO `users` (`email`, `city_id`, `name`, `surname`, `birthday`, `gender`, `password`) VALUES (?, ?, ?, ?, ?, ?, ?);";
$stmt = $db->prepare($sql);
$stmt->bind_param("sssssss", $email, $_POST['city_id'], $name, $surname, $_POST['birthday'], $_POST['gender'], $pass);

//   echo "<pre>";
//   print_r($_POST);
//   echo "</pre>";
}

if($stmt->execute()){
  $_SESSION['error']['succes'] = "Prawidlowo dodano użytkownia";
  header('location: ../');
} else {
  $_SESSION['error'] = "Nie dodano użytkownika";

  if(!isset($_SESSION['coun'])){
    $_SESSION['coun']=1;
  } else $_SESSION['coun']++;


  header('location: ../pages/register.php');
}
 ?>
