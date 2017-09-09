<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';

$id = $_POST["id"];
$name = $_POST["name"];
$bio = $_POST["bio"];
$frbsNotifId = $_POST["frbs_notif_id"];

$sql = "UPDATE `user` SET `name` = ?, `bio` = ?, `frbs_notif_id` = ? WHERE `id` = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("sssi", $name, $bio, $frbsNotifId, $id);
if ($stmt->execute()) {
	echo json_encode(array("success" => true));
}