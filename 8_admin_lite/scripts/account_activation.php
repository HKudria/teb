<?php
session_start();
if(!empty($_GET['activation_link'])&&!empty($_GET['email'])) {
    require_once './connect.php';
    $sql = "SELECT * FROM `activation_link` WHERE `user_email` = '$_GET[email]' AND `link` = '$_GET[activation_link]' ";
    $result = $db->query($sql);
    $user = $result->fetch_assoc();

    //sprawdzamy czy link i email jest w bazie
    if (!empty($user)) {

        //sprawdzamy czy email juz byl aktywowany
        if (!empty($user['updated_at'])){
            $_SESSION['error']['succes'] = "Email juz byl aktywowany";
            header('location: ../');
            exit();
        }

       //sprawdzamy czas linka
        $now = new DateTime();
        $now->format('Y-m-d H:i:s');
        $created_at = DateTime::createFromFormat("Y-m-d H:i:s", $user['created_at']);
        $time = $now->diff($created_at);

        if($time->h>24) {
            //jezeli link starszy od 24 godzin to wycofujemy uzytkownika z systemu
            $_SESSION['error'] = "Link już nie aktywny";
            $sql = "DELETE FROM `users` WHERE `email` = '$_GET[email]'";
            $db->query($sql);
            $sql = "DELETE FROM `activation_link` WHERE `user_email` = '$_GET[email]'";
            $db->query($sql);
            header('location: ../');
            exit();
        } else {
            //jezeli data linku jest dobra to aktualizujemy aktywacje konta
            //update daty aktywacji
            $sql = "UPDATE `activation_link` SET `updated_at` = CURRENT_TIME() WHERE `user_email` = '$_GET[email]'";
            $db->query($sql);
            //update aktywacji konta
            $sql = "UPDATE `users` SET `activity_id` = '2'  WHERE `users`.`email` = '$_GET[email]'";
            $db->query($sql);

            //sprawdzamy czy konto jest aktywowane
            if ($db->affected_rows) {
                $_SESSION['error']['succes'] = "Email aktywowano pomyśłnie";
                header('location: ../');
            } else {
                $_SESSION['error'] = "Database error";
                header('location: ../');
            }
        }

    } else { //jezeli dane ne nie są w bazie
        $_SESSION['error'] = "Takie dane nie istnieją";
        header('location: ../');
    }
} else { //jezeli pusty $_GET
    $_SESSION['error'] = "Link aktywacij jest nie prawidłowy";
    header('location: ../');
}


