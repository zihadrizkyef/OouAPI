<?php

/**
 * بسم الله الرحمن الرحيم
 * Created by zihadrizkyef on Monday, September 18th 2017, 9:21:19 am
 */

$con = new mysqli();
include_once 'API_INIT.php';

$id = $_POST["id"];
$message = $_POST["message"];
$readed = $_POST["readed"];

$data["action"] = "edit_chat";

$sql = "UPDATE `chat_row` SET `message` = ?, `readed` = ? WHERE `chat_row`.`id` = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("sii", $message, $readed, $id);
if ($stmt->execute()) {
	$sql = "SELECT * FROM `chat_row` WHERE `id` = ?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("i", $id);
	$stmt->execute();
	$msgLoad = $stmt->get_result()->fetch_assoc();
	
	$sql = "SELECT image_url FROM `user` WHERE id=?";
	$stmt = $con->prepare($sql);id);
	$stmt->execute();
	$result = $stmt->get_result();
	if ($result->num_rows > 0) {
		$parse = $result->fetch_assoc();
		$msgLoad["image_url"] = "profilePicture/".$parse["image_url"];
	}

	$sql = "SELECT name, is_group, image_url FROM chat_room WHERE id=".$chatRoomId;
	$result_room = $con->query($sql);
	$room = $result_room->fetch_assoc();
	if ($room["is_group"] == 0) {
		$sql = "SELECT user_id FROM chat_room_member WHERE user_id !=? AND chat_room_id = ?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("ii", $id, $chatRoomId);
		$stmt->execute();
		$id_recepient = $stmt->get_result()->fetch_assoc()["user_id"];

		$sql = "SELECT name, frbs_notif_id FROM user WHERE id=?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("i", $id_recepient);
		$stmt->execute();
		$result_profile = $stmt->get_result()->fetch_assoc();

		$data["title"] = $result_profile["name"];
		$notifTarget = $result_profile["frbs_notif_id"];
	} else {
		$sql = "SELECT group_frbs_notif_id FROM `chat_room` WHERE id=?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("i", $chatRoomId);
		$stmt->execute();
		
		$data["title"] = $room["name"];
		$notifTarget = "/topics/".$stmt->get_result()->fetch_assoc()["group_frbs_notif_id"];
	}

	$data["msg"] = $msgLoad;

	$fields = array(
		"to" => $notifTarget,
		"priority" => "high",
		"data" => $data
	);
	$headers = array(
		"Authorization: " . $apiKey,
		"Content-Type: application/json"
	);
	#Send Reponse To FireBase Server	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, "https://fcm.googleapis.com/fcm/send");
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
	$result = curl_exec($ch);
	curl_close($ch);
	#Echo Result Of FireBase Server
	
	echo json_encode($msgLoad);
}