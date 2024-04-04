<?php 
session_start();

if(isset($_SESSION['email'])) {
  header("Location: datalist.php");
  exit(); 
}
else{
    header("Location: giris.php");
    exit();
}