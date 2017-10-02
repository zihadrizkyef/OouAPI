<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';

$username = $_POST["username"];
$password = $_POST["password"];
$name = $_POST["name"];
$frbs_notif_id = $_POST["frbs_notif_id"];

$sql = "INSERT INTO `user` (`username`, `password`, `name`, `frbs_notif_id`) VALUES (?, ?, ?, ?)";
$stmt = $con->prepare($sql);
$stmt->bind_param("ssss",  $username, $password, $name, $frbs_notif_id);
if ($stmt->execute()) {
	$arr = array("id" => $con->insert_id);
	echo json_encode($arr);
}