<?php
session_start();
require 'config.php';

$user_id = $_SESSION['user_id'];
$receiver_id = $_POST['receiver_id']; // Asegúrate de que este valor se pase correctamente

// Obtener los mensajes entre el usuario actual y el contacto seleccionado
$stmt = $conn->prepare("
    SELECT m.message, m.sent_at, m.sender_id, u.username
    FROM messages m
    JOIN users u ON m.sender_id = u.id
    WHERE (m.sender_id = ? AND m.receiver_id = ?)
       OR (m.sender_id = ? AND m.receiver_id = ?)
    ORDER BY m.sent_at ASC
");
$stmt->bind_param("iiii", $user_id, $receiver_id, $receiver_id, $user_id);
$stmt->execute();
$result = $stmt->get_result();

$messages = [];
while ($row = $result->fetch_assoc()) {
    $messages[] = $row;
}

$stmt->close();
?>


<?php foreach ($messages as $message): ?>
    <div class="chat-message <?php echo $message['sender_id'] == $user_id ? 'outgoing' : 'incoming'; ?>">
        <div class="message-box">
            <p><?php echo $message['message']; ?></p>
            <span class="message-time"><?php echo date('H:i', strtotime($message['sent_at'])); ?></span>
        </div>
    </div>
<?php endforeach; ?>


