<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Dane użytkownika</title>
  </head>
  <body>
    <h3>Dane użytkownika</h3>
    <form method="get">
      <input type="text" name="name" placeholder="Podaj imię"><br><br>
      <input type="text" name="nazwisko" placeholder="Podaj nazwisko"><br><br>
      <input type="radio" name="sex" value="m" checked>Mężczyzna
      <input type="radio" name="sex" value="k">Kobieta <br><br>
      <input type="submit" value="Zatwierdż">

    </form>

    <?php
    //placeholder - подсказка для поля
    //isset — Определяет, была ли установлена переменная значением, отличным от null
    //empty — Проверяет, пуста ли переменная
    if (!empty($_GET['name'])&&!empty($_GET['nazwisko'])) {
      switch ($_GET['sex']) {
        case 'm':
          $sex = 'mężczyzna';
          break;
        default:
          $sex = 'kobieta';
          break;
        }
      echo <<< T
      Twoje imię:  $_GET[name] <br>
      Twoje nazwisko: $_GET[nazwisko] <br>
      Twoja płeć : $sex
    T;
    }
    ?>
  </body>
</html>
