<?php
session_start();

if(!empty($_POST)){
    foreach ($_POST as $value){
        if(empty($value)){
            $_SESSION['error'] = "Wypełnij wszystkie poła";
            header('location: ../');
            exit();
        }

        require_once '../functions/regex.php';
        if(stringRegex($_POST['email'],'email')){
            $email = stringRegex($_POST['email'],'email');
        } else {
            header('location: ../');
            exit();
        }

        //sprawdzamy czy mail jest prawidlowo wypelniony
        require_once '../scripts/connect.php';
        $sql = "SELECT * FROM `user` WHERE `email` = '$email'";
        $result = $db->query($sql);
        $user = $result->fetch_assoc();

        //sprawdzamy czy istnije taki użytkownik
        if(!empty($user)){
            //sprawdzamy hasło
            if (password_verify($_POST['password'],$user['password'])){

                if($user['activity_id']==2) {
                    $_SESSION['error']['succes']= "Witaj ". $user['email'];
                        $_SESSION['logged']['role_id'] = $user['role_id'];
                        $_SESSION['logged']['email'] = $user['email'];
                        $_SESSION['logged']['name'] = $user['name'];
                        $_SESSION['logged']['surname'] = $user['surname'];
                        $_SESSION['logged']['avatar'] = $user['avatar'];
                    $sql = "SELECT `role_id` FROM `userRole` WHERE `user_id` = '$user[id]'";
                    $result = $db->query($sql);
                    $user = $result->fetch_assoc();
                    $_SESSION['logged']['role_id'] = $user['role_id'];
                       header('location: ../pages/logged/home.php');
                        exit();
                } else {
                    $sql = "SELECT `description` FROM `activity` WHERE `activity_id` = '$user[activity_id]'";
                    $result = $db->query($sql);
                    $description = $result->fetch_assoc();
                    $_SESSION['error'] = $description['description'];
                }

                //ten sposób też dziła poprawnie
//                $sql = "SELECT `description` FROM `activity` WHERE `activity_id` = '$user[activity_id]'";
//                $result = $db->query($sql);
//                $description = $result->fetch_assoc();
//
//                switch ($user['activity_id']){
//                    case 1:
//                        $_SESSION['error'] = $description['description'];
//                        break;
//                    case 2:
//                        $_SESSION['error']['succes']= "Witaj ". $user['email'];
//                        $_SESSION['logged']['role_id'] = $user['role_id'];
//                        $_SESSION['logged']['email'] = $user['email'];
//                        header('location: ../pages/logged/home.php');
//                        exit();
//                        break;
//                    case 3:
//                        $_SESSION['error'] = $description['description'];
//                        break;
//                    case 4:
//                        $_SESSION['error'] = $description['description'];
//                        break;
//                }

                header('location: ../');
                exit();
                //jeżeli hasło prawidlowo to w sesie wpisujemy pozwolenia dla usera i jego mail do wyswetlenia
            } else {
                //sprawdzenia blędnego hasła
                $_SESSION['error'] = "Nie prawidłowy email czy hasło";
                header('location: ../');
                exit();
            }
        } else {
            //sprawdzenia usera
            $_SESSION['error'] = "Nie prawidłowy email czy hasło";
            header('location: ../');
            exit();
        }
    }
} else {
    header('location: ../');
    exit();
}

