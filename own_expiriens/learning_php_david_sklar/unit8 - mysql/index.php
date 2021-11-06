<?php
try {
$db = new PDO('mysql:host=localhost;dbname=test', 'root','');
//echo "Connection with DataBase - ok";
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // I don't know what it's mean
$q = $db->exec("CREATE TABLE cars (
                car_id INT,
                car_name VARCHAR(255),
                price DECIMAL(4,2),
                is_gas INT
              )");
} catch (PDOException $e){
  echo "Connection with DataBase - Fault " . $e->getMessage();
}
 ?>


<!-- VARCHAR(length) - Символьная строка переменной длины, определяемой параметром length

INT - Целое число

BLOB - Строковые или двоичные данные длиной до 64 Кбайт
Этот тип столбца в PostgreSQL называется BYTEA вместо BLOB.

DECIMAL(total_digits, decimal_places) - Десятичное число, где общее количество цифр определяется параметром total_digits, а количество цифр после десятичной точки – параметром decimal_places

DATETIME - дата и время 2000-03-20 19:45:00
Этот тип столбца в Oracle называется DATE вместо DATETIME. -->
