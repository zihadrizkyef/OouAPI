<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';

$roomId = $_GET["room_id"];
$offset = $_GET["offset"];
$sql = "SELECT * FROM (
	SELECT * FROM chat_row WHERE chat_room_id=? ORDER BY id DESC LIMIT ?
	)sub
	ORDER BY id ASC";
$stmt = $con->prepare($sql);
echo $con->error;
$stmt->bind_param("ii", $roomId, $offset);
$stmt->execute();
$result = $stmt->get_result();
$chatRowList = array();
if ($result->num_rows > 0) {
	while($chat = $result->fetch_assoc()) {
		$idProfile = $chat["sender_id"];
		$sql = "SELECT image_url FROM `user` WHERE id=?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("i",  $idProfile);
		$stmt->execute();
		$chat["image_url"] = "profilePicture/".$stmt->get_result()->fetch_assoc()["image_url"];
		array_push($chatRowList, $chat);
	}
}
echo json_encode($chatRowList);