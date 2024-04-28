import 'package:chatapp/constants/constants.dart';
import 'package:flutter/material.dart';

class MyHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          Text(
            "ChatLite",
            style: TextStyle(
                fontSize: 20, fontWeight: mediumFontWeight, color: kWhite),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      iconTheme: const IconThemeData(color: kWhite),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
