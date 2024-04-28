import 'package:chatapp/components/message_bubble.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/constants/constants.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverId;

  ChatPage({required this.receiverEmail, required this.receiverId, super.key});

  final TextEditingController messageController = TextEditingController();

  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(receiverId, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          receiverEmail,
          style: const TextStyle(
            color: kWhite,
            fontSize: 20,
            fontWeight: mediumFontWeight,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: const IconThemeData(color: kWhite),
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(
            child: buildMessageList(),
          ),
          // user input
          buildUserInput(context),
        ],
      ),
    );
  }

  Widget buildMessageList() {
    String senderId = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(receiverId, senderId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Error",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text(
              "Loading...",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "No messages yet",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children: snapshot.data!.docs
                .map((doc) => buildMessageItem(doc, senderId))
                .toList(),
          ),
        );
      },
    );
  }

  Widget buildMessageItem(DocumentSnapshot doc, String currentUserId) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user ?
    bool isCurrentUser = data["senderId"] == currentUserId;

    return Column(
      crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        MessageBubble(message: data["message"], isCurrentUser: isCurrentUser)
      ],
    );
  }

  Widget buildUserInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: messageController,
              hintText: "Type a message",
              obscureText: false,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}
