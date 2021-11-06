<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/style.css">
    <title>Użytkownicy</title>
  </head>
  <body>
    <h4>Użytkownicy</h4>
    <?php
      session_start();
      require_once './scripts/connect.php';
      $sql = "SELECT * FROM `users` INNER JOIN `cities` ON users.city_id = cities.city_id;"; //соеденение двух таблиц
      $result = $connect->query($sql);

      echo <<< TABLE
      <table>
        <tr>
          <th>ID</th>
          <th>Imię</th>
          <th>Nazwisko</th>
          <th>Miasto</th>
          <th>Data urodzenia</th>
        </tr>
      TABLE;

      while ($row = $result->fetch_assoc()) { //вывод всех данных с таблицы
        echo <<< USER
          <tr>
            <td>$row[user_id] </td>
            <td>$row[name] </td>
            <td>$row[surname] </td>
            <td>$row[city] </td>
            <td>$row[birthday] </td>
            <td><a href="./scripts/delete.php?deleteId=$row[user_id]">Usuń</a></td>
          </tr>

        USER;
      }
      echo "</table>";

      if(!empty($_SESSION['aRow']))
      {
      if ($_SESSION['aRow']==-1){
        echo 'nie udalo się usunąć dannych';
      } else {
          echo "Usuniento dannych " . $_SESSION['aRow'] . "<br>";
          echo "O numerze id " . $_SESSION['id'];
          unset($_SESSION['id']);
      }

      unset($_SESSION['aRow']);
     }
     echo "<hr>";

     if(!empty($_SESSION['error'])){
       echo $_SESSION['error'] . "<br>";
       unset($_SESSION['error']);
     }

     if(isset($_GET['addUser'])){

       echo <<< FORM

       <h4> Dodawanie użytkownika </h4>
       <form action="./scripts/insert.php" method="post">
         <input type="text" name="name" placeholder="Podaj imię"> <br><br>
         <input type="text" name="surname" placeholder="Podaj nazwisko"> <br><br>
         <input type="number" name="city_id" placeholder="Wprowadz Miasto"> <br><br>
         <input type="date" name="birthday"> Data urodzenia <br><br>
         <input type="submit" name="" value="Zatwierdż">
       </form>
       FORM;
     } else {
       echo '<a href="./4_db_select_table_insert.php?addUser=">Dodaj użytkownika</a>';
     }

      ?>

        </body>
</html>
