import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const MessageBubble(
      {required this.message, required this.isCurrentUser, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isCurrentUser
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
      child: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
