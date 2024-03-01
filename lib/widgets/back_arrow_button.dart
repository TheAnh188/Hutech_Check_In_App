import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
      icon: Icon(
        MyIcons.backArrow,
        size: MySizes.size24SW,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
