<?php
//echo "test plik";

$name = "dssss";
$surname = "fdfddf";
//$name = "Ja[/^] ; [A-z]
if (preg_match("/^[a-zA-Z]{2,12}$/", $name)){
    echo "Imię poprawne<br>";
    $name = ucfirst(mb_strtolower($name));
    echo $name."<br>";
} else {
    echo "Imię może miescić tylko male litery od 2 do 12 znaków<br>";
}


if (preg_match("/^[a-zA-Z]{2,20}$/", $surname)){
    echo "Nazwisko poprawne<br>";
    $surname = ucfirst(mb_strtolower($surname));
    echo $surname."<br>";
} else {
    echo "Nazwisko może miescić tylko male litery od 2 do 12 znaków<br>";
}