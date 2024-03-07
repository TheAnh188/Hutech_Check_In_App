import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class BackArrowButton extends StatefulWidget {
  const BackArrowButton({super.key});

  @override
  State<BackArrowButton> createState() => _BackArrowButtonState();
}

class _BackArrowButtonState extends State<BackArrowButton> {
  void _onPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
      icon: Icon(
        MyIcons.backArrow,
        size: MySizes.size24SW,
      ),
      onPressed: _onPressed,
    );
  }
}
