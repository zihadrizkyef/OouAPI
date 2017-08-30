<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';

$userameToRead = $_GET["username"];
$sql = "SELECT id, username, name, bio, image_url FROM `user` WHERE username=?";
$stmt = $con->prepare($sql);
$stmt->bind_param("s",  $userameToRead);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) {
	$parse = $result->fetch_assoc();
	$parse["image_url"] = "profilePicture/".$parse["image_url"];
	echo json_encode($parse);
}