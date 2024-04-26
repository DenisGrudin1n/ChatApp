import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: Row(children: [
          const Icon(
            Icons.person,
            size: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          )
        ]),
      ),
    );
  }
}
