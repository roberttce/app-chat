<?php
session_start();
require 'config.php';

$sender_id = $_SESSION['user_id'];
$receiver_id = $_GET['receiver_id'];

$stmt = $conn->prepare("
    SELECT m.id, m.sender_id, m.receiver_id, m.message, m.sent_at, u.username AS sender_name
    FROM messages m
    JOIN users u ON m.sender_id = u.id
    WHERE (m.sender_id = ? AND m.receiver_id = ?)
       OR (m.sender_id = ? AND m.receiver_id = ?)
    ORDER BY m.sent_at ASC
");
$stmt->bind_param("iiii", $sender_id, $receiver_id, $receiver_id, $sender_id);
$stmt->execute();
$result = $stmt->get_result();

$messages = [];
while ($row = $result->fetch_assoc()) {
    $messages[] = $row;
}

echo json_encode($messages);
?>
