import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class UpdateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool numberKeyboard;
  final bool obscureText;
  final String? toolTipText;
  const UpdateTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.numberKeyboard,
    required this.obscureText,
    this.toolTipText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MySizes.size50SW,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: MySizes.size10SW),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.black),
        borderRadius: BorderRadius.circular(MySizes.size10SW),
      ),
      child: TextField(
        obscureText: false,
        style: MyTextStyles.content15BoldBlackSW,
        controller: controller,
        inputFormatters: numberKeyboard
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : null,
        keyboardType: numberKeyboard ? TextInputType.number : null,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: toolTipText != null
              ? Tooltip(
                  showDuration: const Duration(milliseconds: 500),
                  preferBelow: false,
                  triggerMode: TooltipTriggerMode.tap,
                  message: toolTipText,
                  child: Icon(
                    MyIcons.info,
                    color: MyColors.blue,
                    size: MySizes.size20SW,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
