<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';


$chatRoomList = array();
$id = $_GET["id"];
$sql = "SELECT chat_room_id FROM chat_room_member WHERE user_id=?";
$stmt = $con->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result_chatroomid = $stmt->get_result();
if ($result_chatroomid->num_rows > 0) {
	while ($row = $result_chatroomid->fetch_assoc()) {
		$roomData = array();
		$roomData["id"] = $row["chat_room_id"];
		
		$sql = "SELECT name, is_group, image_url, last_activity FROM chat_room WHERE id=".$roomData['id'];
		$result_name = $con->query($sql);
		$room = $result_name->fetch_assoc();
		$roomData["name"] = $room["name"];
		$roomData["is_group"] = $room["is_group"];
		$roomData["image_url"] = "profilePicture/".$room["image_url"];
		$roomData["last_activity"] = $room["last_activity"];
		if ($room["is_group"] == 0) {
			$sql = "SELECT user_id FROM chat_room_member WHERE user_id !=? AND chat_room_id = ?";
			$stmt = $con->prepare($sql);
			$stmt->bind_param("ii", $id, $roomData["id"]);
			$stmt->execute();
			$id_recepient = $stmt->get_result()->fetch_assoc()["user_id"];

			$sql = "SELECT name, image_url FROM user WHERE id=?";
			$stmt = $con->prepare($sql);
			$stmt->bind_param("i", $id_recepient);
			$stmt->execute();
			$result_profile = $stmt->get_result()->fetch_assoc();
			$name = $result_profile["name"];
			$image_url = $result_profile["image_url"];

			$roomData["name"] = $result_profile["name"];
			$roomData["image_url"] = "profilePicture/".$result_profile["image_url"];
		}
		$roomId = $roomData["id"];

		$sql = "SELECT readed FROM chat_row WHERE chat_room_id=$roomId AND sender_id != $id AND readed=0";
		$unreadedMessage = $con->query($sql)->num_rows;
		$roomData["unreaded_message"] = $unreadedMessage;
		
		$roomData["message"] = "";
		$sql = "SELECT message FROM chat_row WHERE chat_room_id=$roomId ORDER BY id DESC LIMIT 1";
		$result_message = $con->query($sql);
		if ($result_message) {
			if ($result_message->num_rows > 0) {
				$message = $result_message->fetch_assoc();
				$roomData["message"] = $message["message"];
			}
		}
		array_push($chatRoomList, $roomData);
	}
}

echo json_encode($chatRoomList);
