<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';

$creatorId = $_POST['creator_id'];
$isGroup = $_POST["is_group"];

if ($isGroup == 0) {
	$recepientId = $_POST["recepient_id"];
	$sql = "SELECT a.chat_room_id FROM chat_room_member a JOIN chat_room_member b 
		ON b.chat_room_id = a.chat_room_id 
		WHERE a.user_id = ? AND b.user_id = ?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("ii", $creatorId, $recepientId);
	$stmt->execute();
	$checkExists = $stmt->get_result();
	if ($checkExists->num_rows > 0) {
		echo json_encode(array("room_id" => $checkExists->fetch_assoc()["chat_room_id"]));
	} else {
		$sql = "INSERT INTO `chat_room` (`name`, `is_group`) VALUES (null, 0)";
		$con->query($sql);
		$roomCreatedId = $con->insert_id;
		
		$sql = "INSERT INTO `chat_room_member` (`chat_room_id`, `user_id`) VALUES (?, ?)";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("ii", $roomCreatedId, $creatorId);
		$stmt->execute();
		$stmt->bind_param("ii", $roomCreatedId, $recepientId);
		$stmt->execute();
		echo json_encode(array("room_id" => $roomCreatedId));
	}
} elseif ($isGroup == 1) {
	$name = $_POST["name"];
	$groupFrbsNotifId = "room_chat_".uniqid();
	$sql = "INSERT INTO `chat_room` (`name`, `is_group`, `group_frbs_notif_id`) VALUES (?, 1, ?)";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("ss",  $name, $groupFrbsNotifId);
	$stmt->execute();
	$roomCreatedId = $con->insert_id;

	$sql = "INSERT INTO `chat_room_member` (`chat_room_id`, `user_id`) VALUES (?, ?)";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("ii", $roomCreatedId, $creatorId);
	$stmt->execute();
	echo json_encode(array("room_id" => $roomCreatedId));
}