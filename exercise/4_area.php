<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Obliczenia prostokonta</title>
  </head>
  <body>
    Podaj dlugości stron: <br><br>
  <form action="skrypt.php" method="post">
    <input type="number" name="a" placeholder="Podaj dlugość strony A">
    <input type="number" name="b" placeholder="Podaj dlugość strony B">
    <input type="submit" name="button" value="Zatwierd">
  </form>

  <?php
  include 'skrypt.php';
   ?>


  </body>
</html>
