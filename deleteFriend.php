<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

$con = new mysqli();
include_once 'API_INIT.php';

$id1 = min(intval($_POST["id1"]), intval($_POST["id2"]));
$id2 = max(intval($_POST["id1"]), intval($_POST["id2"]));

if ($id1 != $id2) {
	$sql = "DELETE FROM `friend` WHERE userid_1=? AND userid_2=?";
	$stmt = $con->prepare($sql);
	$stmt->bind_param("ii", $id1, $id2);
	$stmt->execute();
	$result = $stmt->get_result();
	echo json_encode(array("success" => true));
}