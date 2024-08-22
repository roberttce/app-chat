let chatWithId = null;

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.contact-link').forEach(link => {
        link.addEventListener('click', function() {
            chatWithId = this.getAttribute('data-id');
            document.getElementById('chat-with-name').innerText = this.innerText;
            loadMessages();
        });
    });

    document.getElementById('send-btn').addEventListener('click', sendMessage);

    document.getElementById('message-input').addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            sendMessage();
        }
    });

    setInterval(loadMessages, 3000); // Auto-refresh messages every 3 seconds
});

function loadMessages() {
    if (chatWithId) {
        fetch('message.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'receiver_id=' + chatWithId
        })
        .then(response => response.text())
        .then(data => {
            const chatMessages = document.getElementById('chat-messages');
            chatMessages.innerHTML = data;
            chatMessages.scrollTop = chatMessages.scrollHeight;
        });
    }
}

function sendMessage() {
    const messageInput = document.getElementById('message-input');
    const message = messageInput.value.trim();

    if (message !== '' && chatWithId) {
        fetch('send_message.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'receiver_id=' + chatWithId + '&message=' + encodeURIComponent(message)
        })
        .then(() => {
            messageInput.value = '';
            loadMessages();
        });
    }
}
