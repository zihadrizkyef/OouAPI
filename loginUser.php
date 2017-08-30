<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';

$username = $_POST["username"];
$password = $_POST["password"];
$sql = "SELECT * FROM `user` WHERE username=? AND password=?";
$stmt = $con->prepare($sql);
$stmt->bind_param("ss",  $username, $password);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) {
	$parse = $result->fetch_assoc();
	unset($parse["password"]);
	echo json_encode($parse);
}