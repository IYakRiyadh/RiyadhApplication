<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$email = $_POST["email"];
$sandi = $_POST["sandi"];


require 'koneksi.php';


$list = "";

$query = "select * from data_user where email='$email' AND sandi='$sandi'";

$result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) > 0) {
  while ($row = mysqli_fetch_array($result)) {
    if ($list == "") {

      $id = $row['id'];
      $nama = $row['name'];
      $alamat = $row['alamat'];
      $wa = $row['no_wa'];
      $email = $row['email'];
    }
  }
}

if (mysqli_num_rows($result) == 0) {
  $response["sukses"] = "0";
  $response["message"] = "user is not Registered, Please Register";
  echo json_encode($response);
  mysqli_close($conn);
} else {
  $response["sukses"] = "1";
  $response["message"] = "Logged in successful";
  $response["id"] = $id;
  $response["nama"] = $nama;
  $response['alamat'] = $alamat;
  $response['no_wa'] = $wa;
  $response["email"] = $email;
  echo json_encode($response);
  mysqli_close($conn);
}
