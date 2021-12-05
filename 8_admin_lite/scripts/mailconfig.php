<?php
//$to      = 'nonameck@gmail.com';
//$subject = 'the subject';
//$message = 'hello';
//$headers = array(
//    'From' => 'nonameck@gmail.com',
//    'Reply-To' => 'nonameck@gmail.com',
//    'X-Mailer' => 'PHP/' . phpversion()
//);

//mail($to, $subject, $message, $headers);

//https://stackoverflow.com/questions/48001020/how-to-send-mail-from-my-mac-using-local-xampp-with-php-contacts-form


//$mail->SMTPDebug = 2; // Enable verbose debug output
$mail->isSMTP(); // Set mailer to use SMTP
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true; // Enable SMTP authentication
$mail->Username = ''; // SMTP username
$mail->Password = ''; // SMTP password
$mail->SMTPSecure = 'ssl';
$mail->Port = 465;


