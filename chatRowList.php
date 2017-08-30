<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';

$roomId = $_GET["room_id"];
$sql = "SELECT * FROM chat_row WHERE chat_room_id=?";
$stmt = $con->prepare($sql);
$stmt->bind_param("i", $roomId);
$stmt->execute();
$result = $stmt->get_result();
$chatRowList = array();
if ($result->num_rows > 0) {
	while($chat = $result->fetch_assoc()) {
		array_push($chatRowList, $chat);
	}
}
echo json_encode($chatRowList);