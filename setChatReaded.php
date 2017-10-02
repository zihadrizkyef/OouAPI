<?php

/**
 * بسم الله الرحمن الرحيم
 * Created by zihadrizkyef on Wednesday, September 27th 2017, 9:46:38 am
 */

$con = new mysqli();
include_once 'API_INIT.php';

$messageId = $_POST["chat_id"];

$data["action"] = "chat_readed";

$sql = "UPDATE `chat_row` SET `readed` = 1 WHERE `id` = ?";
$stmtUpdate = $con->prepare($sql);
$stmtUpdate->bind_param("i", $messageId);
if ($stmtUpdate->execute()) {
    $sql = "SELECT sender_id FROM chat_row WHERE id = ?";
    $stmtSenderId = $con->prepare($sql);
    $stmtSenderId->bind_param("i", $messageId);
    $stmtSenderId->execute();
    $senderId = $stmtSenderId->get_result()->fetch_assoc()["sender_id"];

    $sql = "SELECT frbs_notif_id FROM user WHERE id = ?";
    $stmtFrbs = $con->prepare($sql);
    $stmtFrbs->bind_param("i", $senderId);
	$stmtFrbs->execute();
    $notifTarget = $stmtFrbs->get_result()->fetch_assoc()["frbs_notif_id"];

    $msgLoad = array("id" => $messageId);
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
    
    echo json_encode(array("success" => true));
}