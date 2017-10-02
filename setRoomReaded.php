<?php

/**
 * بسم الله الرحمن الرحيم
 * Created by zihadrizkyef on Monday, September 25th 2017, 9:31:03 am
 */

$con = new mysqli();
include_once 'API_INIT.php';
include_once 'FUNC_countAllUnreaded.php';

$id = $_POST["id"];
$roomId = intval($_POST["room_id"]);

$data["action"] = "room_readed";
$data["room_id"] = $roomId;

$sql = "UPDATE `chat_row` SET `readed` = 1 WHERE `chat_room_id` = ? AND sender_id != ?";
$stmtUpdate = $con->prepare($sql);
$stmtUpdate->bind_param("ii", $roomId, $id);
if ($stmtUpdate->execute()) {
	$sql = "SELECT user_id FROM chat_room_member WHERE chat_room_id = ? AND user_id != ?";
	$stmtSenderId = $con->prepare($sql);
	$stmtSenderId->bind_param("ii", $roomId, $id);
	$stmtSenderId->execute();
	$senderId = $stmtSenderId->get_result()->fetch_assoc()["user_id"];

	// $data["unreadedMessageCount"] = countAllUnreaded($con, $senderId);

	$sql = "SELECT frbs_notif_id FROM user WHERE id = ?";
	$stmtFrbs = $con->prepare($sql);
	$stmtFrbs->bind_param("i", $senderId);
	$stmtFrbs->execute();
	$notifTarget = $stmtFrbs->get_result()->fetch_assoc()["frbs_notif_id"];

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
	
	echo json_encode(array("success" => true));
}