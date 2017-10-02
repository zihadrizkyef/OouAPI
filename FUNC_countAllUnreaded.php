<?php

/**
 * بسم الله الرحمن الرحيم
 * Created by zihadrizkyef on Friday, September 29th 2017, 8:40:37 pm
 */

function countAllUnreaded($con, $id) {
    $roomIdList = array();
    $unreadedCount = 0;
    $sqlRoomId = "SELECT chat_room_id FROM chat_room_member WHERE user_id = ?";
    $stmtRoomId = $con->prepare($sqlRoomId);
    $stmtRoomId->bind_param("i", $id);
    $stmtRoomId->execute();
    $resultRoomId = $stmtRoomId->get_result();
    if ($resultRoomId->num_rows > 0) {
        while($fetchRoomId = $resultRoomId->fetch_assoc()) {
            $sqlChatCount = "SELECT id FROM chat_row WHERE chat_room_id = ".$fetchRoomId["chat_room_id"]." AND sender_id != ".$id." AND readed = 0";
            $stmtChatCount = $con->query($sqlChatCount);
            $unreadedCount += $stmtChatCount->num_rows;
        }
        return $unreadedCount;
    } else {
        return 0;
    }
}