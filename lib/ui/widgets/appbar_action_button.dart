import 'package:flutter/material.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton(
      {super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: kAppBarActionsTextStyle),
      ),
    );
  }
}
