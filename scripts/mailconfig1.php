<?php
//U should to write user login and password and rename this file into mailconfig.php



//https://stackoverflow.com/questions/48001020/how-to-send-mail-from-my-mac-using-local-xampp-with-php-contacts-form


//$mail->SMTPDebug = 2; // Enable verbose debug output
$mail->isSMTP(); // Set mailer to use SMTP
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true; // Enable SMTP authentication
$mail->Username = ''; // SMTP username
$mail->Password = ''; // SMTP password
$mail->SMTPSecure = 'ssl';
$mail->Port = 465;


