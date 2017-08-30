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
	$sql = "INSERT INTO `chat_room` (`name`, `is_group`) VALUES (null, 0)";
	if ($con->query($sql)) {
		echo $con->error;
		$roomCreatedId = $con->insert_id;
		$recepientId = $_POST["recepient_id"];
		
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
	$sql = "INSERT INTO `chat_room` (`name`, `is_group`) VALUES (?, 1)";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("s",  $name);
	$stmt->execute();
	$roomCreatedId = $con->insert_id;
	echo $con->error;

	$sql = "INSERT INTO `chat_room_member` (`chat_room_id`, `user_id`) VALUES (?, ?)";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("ii", $roomCreatedId, $creatorId);
	$stmt->execute();
	echo json_encode(array("room_id" => $roomCreatedId));
}