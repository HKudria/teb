<?php
function stringRegex($string,$type = 'name'){
    //http://regex101.com
    $namePattern = "/^[a-zzżźćńółęąśŻŹĆĄŚĘŁÓŃ]{2,12}$/i";
    $emailPattern = "/^\w+@\w+\.[a-z]{2,5}$/i";
    $passwordPattern = "/^\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])(?=\S*[\W])\S*$/"; //min 6 znaków, mala i duża litera i znak specialny
    $surnamePattern = "/^[a-zżźćńółęąśŻŹĆĄŚĘŁÓŃ]{2,12}+([-]?+[a-zżźćńółęąśŻŹĆĄŚĘŁÓŃ]{2,12})?$/i";

    switch ($type){
        case 'name':
            $pattern = $namePattern;
            $error = "Błędnie wypelnilesz imię";
            break;
        case 'surname':
            $pattern = $surnamePattern;
            $error = "Błędnie wypelnilesz nazwisko";
            break;
        case 'email':
            $pattern = $emailPattern;
            $error = "Błędnie wypelnilesz email";
            break;
        case 'password':
            $pattern = $passwordPattern;
            $error = "Błędnie wypelnilesz haslo";
            break;
    }

    if (preg_match($pattern, $string = trim($string))){

        if ($type != 'password'){
            $string = ucfirst(mb_strtolower($string,'UTF-8'));
        }


        //sprawdzamy podwójne nazwisko
        if ($type == 'surname' && preg_match('/-/',$string)){
            $partsurname = explode('-', $string);
            $partsurname[1] = ucfirst($partsurname[1]);
            $string = implode('-',$partsurname);
        }
        return $string;
    } else {
        $_SESSION['error'] = $error;
        return false;
    }

}

            //$test = "adsA343f!";
//if(stringRegex($test,'password')){
//    $test = stringRegex($test,'password');
//    echo $test;
//} else {
//    echo "mistake";
//}

//echo $_SERVER['REMOTE_ADDR'];

