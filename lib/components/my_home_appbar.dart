import 'package:chatapp/constants/constants.dart';
import 'package:flutter/material.dart';

class MyHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            "ChatLite",
            style: TextStyle(
                fontSize: 20,
                fontWeight: mediumFontWeight,
                color: Theme.of(context).colorScheme.tertiary),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      backgroundColor: lightBlue,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.tertiary),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
