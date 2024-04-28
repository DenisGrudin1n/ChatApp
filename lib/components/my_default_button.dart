import 'package:chatapp/constants/constants.dart';
import 'package:flutter/material.dart';

class MyDefaultButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyDefaultButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).highlightColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        fixedSize: MaterialStateProperty.all(const Size(335, 60)),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 16,
            fontWeight: mediumFontWeight),
      ),
    );
  }
}
