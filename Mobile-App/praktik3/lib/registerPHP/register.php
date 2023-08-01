<?php

$nama = $_POST["nama"];
$alamat = $_POST["alamat"];
$wa = $_POST["no_wa"];
$email = $_POST["email"];
$sandi = $_POST["sandi"];

require 'koneksi.php';

$findexist = "select * from data_user where no_wa='$wa'";

$resultsearch = mysqli_query($conn, $findexist);
if (mysqli_num_rows($resultsearch) > 0) {
  while ($row = mysqli_fetch_array($resultsearch)) {
    $result["success"] = "3";
    $result["message"] = "user Already exist";

    echo json_encode($result);
    mysqli_close($conn);
  }
} else {

  $sql = "INSERT INTO 'data_user' (nama,alamat,no_wa,email,sandi) VALUES ('$nama','$alamat','$wa','$email','$sandi');";

  if (mysqli_query($conn, $sql)) {
    $result["success"] = "1";
    $result["message"] = "Registration success";

    echo json_encode($result);
    mysqli_close($conn);
  } else {
    $result["success"] = "0";
    $result["message"] = "error in Registration";
    echo json_encode($result);
    mysqli_close($conn);
  }
}
