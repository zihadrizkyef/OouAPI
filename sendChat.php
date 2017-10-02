<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once "API_INIT.php";
include_once "FUNC_countAllUnreaded.php";

$id = $_POST["id"];
$chatRoomId = $_POST["chat_room_id"];
$text = $_POST["text"];

$data["action"] = "chat_new";

$sql = "INSERT INTO `chat_row` (`chat_room_id`, `sender_id`, `message`) VALUES (?, ?, ?)";
$stmt = $con->prepare($sql);
$stmt->bind_param("iis", $chatRoomId, $id, $text);
if ($stmt->execute()) {
	$chatRowId = $con->insert_id;
	$sql = "SELECT * FROM `chat_row` WHERE `id` = ?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("i", $chatRowId);
	$stmt->execute();
	$msgLoad = $stmt->get_result()->fetch_assoc();
	
	$sql = "SELECT image_url FROM `user` WHERE id=?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("i",  $id);
	$stmt->execute();
	$result = $stmt->get_result();
	if ($result->num_rows > 0) {
		$parse = $result->fetch_assoc();
		if ($parse["image_url"] != "") {
			$msgLoad["image_url"] = "profilePicture/".$parse["image_url"];
		} else {
			$msgLoad["image_url"] = "";
		}
	}

	$con->query("UPDATE chat_room SET last_activity=CURRENT_TIMESTAMP WHERE id=".$chatRoomId);

	$sql = "SELECT name, is_group, image_url FROM chat_room WHERE id=".$chatRoomId;
	$result_room = $con->query($sql);
	$room = $result_room->fetch_assoc();
	if ($room["is_group"] == 0) {
		$sql = "SELECT user_id FROM chat_room_member WHERE user_id !=? AND chat_room_id = ?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("ii", $id, $chatRoomId);
		$stmt->execute();
		$idRecepient = $stmt->get_result()->fetch_assoc()["user_id"];
		$data["unreadedMessageCount"] = countAllUnreaded($con, $idRecepient);

		$sql = "SELECT frbs_notif_id FROM user WHERE id=?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("i", $idRecepient);
		$stmt->execute();
		$result_profile = $stmt->get_result()->fetch_assoc();
		$notifTarget = $result_profile["frbs_notif_id"];

		$sql = "SELECT name FROM user WHERE id=?";
		$stmt = $con->prepare($sql);
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result_profile = $stmt->get_result()->fetch_assoc();
		$data["title"] = $result_profile["name"];
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
	
	echo json_encode($msgLoad);
}