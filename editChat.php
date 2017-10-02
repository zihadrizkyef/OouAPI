<?php

/**
 * بسم الله الرحمن الرحيم
 * Created by zihadrizkyef on Monday, September 18th 2017, 9:21:19 am
 */

$con = new mysqli();
include_once 'API_INIT.php';

$chatId = $_POST["chat_id"];
$message = $_POST["message"];

$data["action"] = "edit_chat";

$sql = "UPDATE `chat_row` SET `message` = ? WHERE `id` = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("si", $message, $chatId);
if ($stmt->execute()) {
	$sql = "SELECT id, chat_room_id, message, sender_id FROM `chat_row` WHERE `id` = ?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("i", $chatId);
	$stmt->execute();
	$msgLoad = $stmt->get_result()->fetch_assoc();
	$chatRoomId = intval($msgLoad["chat_room_id"]);
	$senderId = $msgLoad["sender_id"];

	$sql = "SELECT is_group FROM chat_room WHERE id=".$chatRoomId;
	$result_room = $con->query($sql);
	$room = $result_room->fetch_assoc();
	if ($room["is_group"] == 0) {
		$sql = "SELECT user_id FROM chat_room_member WHERE user_id !=? AND chat_room_id = ?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("ii", $senderId, $chatRoomId);
		$stmt->execute();
		$id_recepient = $stmt->get_result()->fetch_assoc()["user_id"];

		$sql = "SELECT frbs_notif_id FROM user WHERE id=?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("i", $id_recepient);
		$stmt->execute();
		$result_profile = $stmt->get_result()->fetch_assoc();

		$notifTarget = $result_profile["frbs_notif_id"];
	} else {
		$sql = "SELECT group_frbs_notif_id FROM `chat_room` WHERE id=?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("i", $chatRoomId);
		$stmt->execute();
		
		$notifTarget = "/topics/".$stmt->get_result()->fetch_assoc()["group_frbs_notif_id"];
	}

	$data["msg"] = $msgLoad;

	$fields = array(
		"to" => $notifTarget,
		"priority" => "high",
		"data" => $data);
	$headers = array(
		"Authorization: " . $apiKey,
		"Content-Type: application/json");
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