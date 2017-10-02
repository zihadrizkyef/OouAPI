<?php

/**
 * بسم الله الرحمن الرحيم
 * Created by zihadrizkyef on Saturday, September 30th 2017, 11:06:12 am
 */

$con = new mysqli();
include_once 'API_INIT.php';
include_once "FUNC_countAllUnreaded.php";

$id = $_GET["id"];
$unreaded = countAllUnreaded($con, $id);
echo json_encode(array("unreaded" => $unreaded));