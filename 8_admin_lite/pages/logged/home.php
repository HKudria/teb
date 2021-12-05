<?php
session_start();

echo "Witaj " . $_SESSION['logged']['email'];