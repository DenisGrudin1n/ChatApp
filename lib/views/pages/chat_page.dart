import 'package:chatapp/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;

  const ChatPage({required this.receiverEmail, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          receiverEmail,
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 20,
            fontWeight: mediumFontWeight,
          ),
        ),
        backgroundColor: lightBlue,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}
