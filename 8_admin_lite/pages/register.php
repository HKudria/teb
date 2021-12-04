<?php session_start(); ?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ARegistration Page</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
<?php if(!empty($_SESSION['error'])){
  echo <<< KOMUNIKAT
   <div class="card card-danger">
    <div class="card-header">
        <h3 class="card-title">Komunikat</h3>
    </div>
    <div class="card-body">
              $_SESSION[error]
    </div>
              <!-- /.card-body -->
   </div>
  KOMUNIKAT;
  unset($_SESSION['error']);
}
 ?>

  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="../" class="h1"><b>Logowanie</b></a>
    </div>

    <div class="card-body">
      <div class="register-box">

      <p class="login-box-msg">Rejestracja nowego użytkownika</p>

      <form action="../scripts/register.php" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="name" placeholder="Podaj imię" value="<?php echo $_SESSION['form_date']['name'] ?? ''; ?>">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
          <div class="input-group mb-3">
            <input type="text" class="form-control" name="surname" placeholder="Podaj nazwisko" value="<?php echo $_SESSION['form_date']['surname'] ?? ''; ?>">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-user"></span>
              </div>
            </div>
          </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control"  name="email" placeholder="Email" value="<?php echo $_SESSION['form_date']['email'] ?? ''; ?>">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control"  name="email1" placeholder="Powtórz Email" value="<?php echo $_SESSION['form_date']['email1'] ?? ''; ?>">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control"  name="password1" placeholder="Retype password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
<!-- miasto -->
          <!-- select -->

          <div class="input-group mb-3">
            <select class="custom-select" name="city_id">
              <?php
              require_once '../scripts/connect.php';
              $sql = "SELECT * FROM `cities`";
              $result = $db->query($sql);
              while ($city = $result->fetch_assoc()) {
                if($city['city_id'] == $_SESSION['form_date']['city_id']){
                  echo "<option value=\"$city[city_id]\" selected> $city[city] </option>";
                } else
                echo "<option value=\"$city[city_id]\"> $city[city] </option>";
              }
              ?>
            </select>
            <div class="input-group-text">
              <span class="fas fa-city"></span>
            </div>
          </div>
<!-- end miasto -->

<!-- birthday -->
        <div class="input-group mb-3">
          <input type="date" class="form-control"  name="birthday" value="<?php echo $_SESSION['form_date']['birthday'] ?? ''; ?>">
          <div class="input-group-append">
            <div class="input-group-text">
              Data urodzenia
            </div>
          </div>
        </div>

<!-- plec -->
        <div class="input-group mb-3">
        <div class="form-group">
          <div class="custom-control custom-radio">
            <input class="custom-control-input" type="radio" id="gender2" value="0" name="gender" checked>
            <label for="gender2" class="custom-control-label">Kobieta</label>
          </div>
<!--   <?php //echo $_SESSION['form_date']['gender']==0 ? "checked" : ''?>-->
   <!-- <?php echo $_SESSION['form_date']['gender']==1 ? "checked" : ''?>-->
          <div class="custom-control custom-radio">
            <input class="custom-control-input" type="radio" id="gender1" value="1" name="gender" >
            <label for="gender1" class="custom-control-label">Męzczyzna</label>
          </div>


        </div>
<!-- end plec -->

        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
               I agree to the <a href="#">terms</a>
              </label>
            </div>
          </div>



          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <div class="social-auth-links text-center">
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i>
          Sign up using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i>
          Sign up using Google+
        </a>
      </div>

      <a href="../" class="text-center">Już posaidam konto</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
</body>
</html>
