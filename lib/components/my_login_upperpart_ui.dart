import 'package:chatapp/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginUpperUI extends StatelessWidget {
  const LoginUpperUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightBlue,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 225),
              child: Icon(
                Icons.message,
                size: 80,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            Text(
              "ChatLite",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 80,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
