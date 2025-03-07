import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String initialMessage;
  final String initialTime;

  ChatPage({required this.name, required this.initialMessage, required this.initialTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add more actions here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                // Initial Message (Received)
                _buildMessageBubble(
                  message: initialMessage,
                  time: initialTime,
                  isMe: false,
                ),
                SizedBox(height: 8),
                // Response Message (Sent)
                _buildMessageBubble(
                  message: "No worries! I'll wait at the pickup spot. Just let me know when you're here.",
                  time: "06:46 pm",
                  isMe: true,
                ),
                SizedBox(height: 26),
                // Date Divider
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FB),
                      border: Border.all(color: Color(0xFFEAECF0), width: 0.5),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(
                      'Today',
                      style: TextStyle(
                        color: Color(0xFF667084),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Another Received Message
                _buildMessageBubble(
                  message: "Thanks so much! Almost there.",
                  time: "06:45 pm",
                  isMe: false,
                ),
              ],
            ),
          ),
          // Chat Input Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFCFD4DC), width: 1)),
            ),
            child: Row(
              children: [
                // Attachment Button
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    // Add attachment functionality
                  },
                ),
                // Message Input Field
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F6),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                // Send Button
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Add send functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build a chat bubble
  Widget _buildMessageBubble({required String message, required String time, required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isMe ? Color(0xFF3FA2FE) : Color(0xFFF2F3F6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
            bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                color: isMe ? Colors.white.withOpacity(0.6) : Color(0xFF98A1B2),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}