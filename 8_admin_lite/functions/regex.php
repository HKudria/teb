<?php
function stringRegex($string){
    if (preg_match("/^[a-zzżźćńółęąśŻŹĆĄŚĘŁÓŃ]{2,12}$/i", $string = trim($string))){
        $string = ucfirst(mb_strtolower($string,'UTF-8'));
        return $string;
    } else {
        $_SESSION['error'] = "Błędnie wypełnione imię";
        return false;
    }

}

