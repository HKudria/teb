<?php
$to      = 'nonameck@gmail.com';
$subject = 'the subject';
$message = 'hello';
$headers = array(
    'From' => 'nonameck@gmail.com',
    'Reply-To' => 'nonameck@gmail.com',
    'X-Mailer' => 'PHP/' . phpversion()
);

mail($to, $subject, $message, $headers);

//https://stackoverflow.com/questions/48001020/how-to-send-mail-from-my-mac-using-local-xampp-with-php-contacts-form