<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

require 'config.php';
$user_id = $_SESSION['user_id'];
$selected_user_id = isset($_GET['contact']) ? intval($_GET['contact']) : null;
// Fetch the list of users for the sidebar
$users = $conn->query("SELECT id, username FROM users WHERE id != $user_id");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Application</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- Updated to match the CSS file name -->
</head>
<body>
    <div class="chat-container">
    <div class="sidebar">
    <div class="sidebar-header">
        <h2>Contactos</h2>
        <!-- Enlace para cerrar sesión -->
        <a href="logout.php" class="logout-link">Cerrar Cesion</a>
    </div>
        <ul class="contact-list">
            <?php while ($user = $users->fetch_assoc()): ?>
                <li class="contact-item">
                    <a href="#" class="contact-link" data-id="<?php echo $user['id']; ?>">
                        <div class="contact-avatar">
                            <!-- Aquí puedes poner una imagen de avatar si la tienes -->
                            <!--<img src="path_to_avatar_image" alt="<?php echo $user['username']; ?>'s avatar">-->
                        </div>
                        <div class="contact-info">
                            <span class="contact-name"><?php echo $user['username']; ?></span>
                            <!-- Opcionalmente, podrías agregar el estado de los contactos aquí -->
                             
                        </div>
                    </a>
                </li>
            <?php endwhile; ?>
        </ul>
    </div>

        <div class="chat-box">
            <div class="chat-header">
                <h2 id="chat-with-name">
                    <?php echo $selected_user_id ? "$selected_user_id" : "Chat"; ?>
                </h2>
            </div>
            <div class="chat-messages" id="chat-messages">
                <?php 
                if ($selected_user_id) {
                    include_once 'message.php';
                }
                ?>
            </div>
            <div class="chat-input">
                <input type="text" id="message-input" placeholder="Type a message...">
                <button id="send-btn">Enviar</button>
            </div>
        </div>
    </div>

    <script src="js/main.js"></script>
</body>
</html>
