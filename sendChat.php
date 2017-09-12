<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once "API_INIT.php";

$id = $_POST["id"];
$chatRoomId = $_POST["chat_room_id"];
$text = $_POST["text"];

$roomIsGroup = false;

$apiKey = "key=AAAAk--WTxw:APA91bEMCcljdoY6hVxa-FlOzuYpuzn-wNUIilFfhqMs3tQJg9i0OGLyMKaB6EIZ1uZjnik8tcUeunznQrliHpy38vHFRg8vmsfjlnSC0TPErW6phW-hId5bgnJxJuLZMfb97c-cHaVY";
$notif = array(
	"title" => "",
	"body" => $text,
	"sound" => "default",
	"tag" => $chatRoomId
);

$sql = "INSERT INTO `chat_row` (`chat_room_id`, `sender_id`, `message`) VALUES (?, ?, ?)";
$stmt = $con->prepare($sql);
$stmt->bind_param("iis", $chatRoomId, $id, $text);
if ($stmt->execute()) {
	$chatRowId = $con->insert_id;
	$sql = "SELECT * FROM `chat_row` WHERE `id` = ?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("i", $chatRowId);
	$stmt->execute();
	$dataPayload = $stmt->get_result()->fetch_assoc();
	
	$sql = "SELECT image_url FROM `user` WHERE id=?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("i",  $id);
	$stmt->execute();
	$result = $stmt->get_result();
	if ($result->num_rows > 0) {
		$parse = $result->fetch_assoc();
		$dataPayload["image_url"] = "profilePicture/".$parse["image_url"];
	}

	$sql = "SELECT name, is_group, image_url FROM chat_room WHERE id=".$chatRoomId;
	$result_name = $con->query($sql);
	$room = $result_name->fetch_assoc();
	$notif["title"] = $room["name"];
	if ($room["is_group"] == 0) {
		$roomIsGroup = false;
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

		$notif["title"] = $result_profile["name"];
		$notifTarget = $result_profile["frbs_notif_id"];
	} else {
		$roomIsGroup = true;
		$sql = "SELECT group_frbs_notif_id FROM `chat_room` WHERE id=?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("i", $chatRoomId);
		$stmt->execute();
		$notifTarget = "/topics/".$stmt->get_result()->fetch_assoc()["group_frbs_notif_id"];
	}

	
	$data = array(
		"msgCode" => "newChat",
		"msg" => $dataPayload
	);
	$fields = array(
		"to" => $notifTarget,
		"priority" => "high",
		"notification" => $notif,
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
	
	echo json_encode($dataPayload);
}