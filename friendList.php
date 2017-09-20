<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';


$idList = array();
$id = $_GET["id"];
$sql = "SELECT userid_2 FROM friend WHERE userid_1=?";
$stmt = $con->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) {
	while ($row = $result->fetch_assoc()) {
		array_push($idList, $row["userid_2"]);
	}
}
$sql = "SELECT userid_1 FROM friend WHERE userid_2=?";
$stmt = $con->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) {
	while ($row = $result->fetch_assoc()) {
		array_push($idList, $row["userid_1"]);
	}
}

$userProfileList = array();
for ($i = 0; $i < count($idList); $i++) {
	$userameToRead = $idList[$i];
	$sql = "SELECT id, username, name, bio, image_url FROM `user` WHERE id=?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("i",  $userameToRead);
	$stmt->execute();
	$result = $stmt->get_result();
	if ($result->num_rows > 0) {
		$parse = $result->fetch_assoc();
		$parse["image_url"] = "profilePicture/".$parse["image_url"];
		array_push($userProfileList, $parse);
	}
}

echo json_encode($userProfileList);
