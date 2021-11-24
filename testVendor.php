<?php
require_once 'vendor/autoload.php';


$message = Swift_Message::newInstance();
$message->setFrom('test@example.com');
$message->setTo(array('h.kudrya@hotmail,com' => 'Herman Kudria'));
$message->setSubject('Test massage');
$message->setBody(<<<_TEXT_
    Test mail wich doesn't work at localhost
_TEXT_ );

//if I wonna use HTML I should use addPart("text","text/html")
$message->addPart(<<<_HTML_
    <p>Dear James,</р>
    <p>You should try this:</p>
    <ul>
    <li>puree 1 pound of chicken with two pounds of asparagus
        in the blender</li>
    <li>drop small balls of the mixture into a deep fryer.</li>
    </ul>
    <p><em>Yummy!</em</p>
    <p>Love,</p>
    <p>Julia</p>
_HTML_
    // тип MIME в качестве второго аргумента
    , "text/html");

//connect to the mail server
$transport = Swift_SmtpTransport::newInstance('smtp.example.com', 25);
$mailer = Swift_Mailer::newInstance($transport);

//send a massage
$mailer->send($message);

 // List with packages for composer https://packagist.org/
 ?>
