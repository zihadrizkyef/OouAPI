<?php

/**
 * Created by zihadrizkyef
 * بسم الله الرحمن الرحيم
 */


$con = new mysqli();
include_once 'API_INIT.php';

$id = $_POST["id"];
$fileName = "pp_".uniqid();
$targetFile = getcwd()."/profilePicture/".$fileName;

if (move_uploaded_file($_FILES["image"]["tmp_name"], $targetFile)) {
    $sql = "UPDATE `user` SET `image_url` = ? WHERE `id` = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("si", $fileName, $id);
    if ($stmt->execute()) {
        echo json_encode(array("image_url" => $fileName));
    } else {
        echo json_encode(array("image_url" => ""));
    }
} else {
    echo json_encode(array("image_url" => ""));
}