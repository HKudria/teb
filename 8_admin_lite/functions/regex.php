<?php
function stringRegex($string,$type = 'name'){
    $namePattern = "/^[a-zzżźćńółęąśŻŹĆĄŚĘŁÓŃ]{2,12}$/i";
    $emailPattern = "/^\w+@\w+\.[a-z]{2,5}$/i";
    $passwordPattern = "";
    $surnamePattern = "/^[a-zżźćńółęąśŻŹĆĄŚĘŁÓŃ]{2,12}+([-]?+[a-z]{2,12})?$/i";

    if ($type == 'name'){
        $pattern = $namePattern;
        $error = "Błędnie wypelnilesz imię";
    }

    if ($type == 'surname'){
        $pattern = $surnamePattern;
        $error = "Błędnie wypelnilesz nazwisko";
    }

    if ($type == 'email'){
        $pattern = $emailPattern;
        $error = "Błędnie wypelnilesz email";
    }

    if ($type == 'password'){
        $pattern = $passwordPattern;
        $error = "Błędnie wypelnilesz haslo";
    }

    if (preg_match($pattern, $string = trim($string))){
        $string = ucfirst(mb_strtolower($string,'UTF-8'));
        return $string;
    } else {
        $_SESSION['error'] = $error;
        return false;
    }

}

//$test = "h.";
//if(stringRegex($test,'surname')){
//    $test = stringRegex($test,'surname');
//    echo $test;
//} else {
//    echo "mistake";
//}

