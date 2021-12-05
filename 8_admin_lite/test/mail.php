<?php

require_once('../SMTP.php');
require_once('../PHPMailer.php');
require_once('../Exception.php');

use \PHPMailer\PHPMailer\PHPMailer;
use \PHPMailer\PHPMailer\Exception;

$mail = new PHPMailer(false); // Passing `true` enables exceptions

try {
    //settings
    require_once '../mailconfig.php';
    //from
    $mail->setFrom('hermanwebmasterpl@gmail.com', 'Herman webmaster');

    //recipient
    $mail->addAddress('h.kudrya@hotmail.com', 'Test mail');     // Add a recipient

    //content

    $mail->isHTML(true); // Set email format to HTML
    $mail->Subject = 'Here is the subject without debug';
    $mail->Body = 'This is the HTML message body <b>in bold!</b>';
    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();

    echo 'Message has been sent';
} catch (Exception $e) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
}


