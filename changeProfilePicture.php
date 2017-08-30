<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';
include_once 'uploadImageFunc.php';

$imageBytes = json_decode($_POST["imageBytes"]);
$userId = $_POST["id"];

$imageName = array(uniqid());
uploadImages("profilePicture", $imageName, $imageBytes);

$sql = "UPDATE `user` SET `image_url` = ? WHERE `user`.`id` = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("si", $imageName[0], $userId);
$stmt->execute();
echo "success";