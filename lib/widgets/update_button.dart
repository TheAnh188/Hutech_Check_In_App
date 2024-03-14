import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class UpdateButton extends StatefulWidget {
  final Function() update;
  final bool? sucess;
  const UpdateButton({
    super.key,
    required this.update,
    this.sucess,
  });

  @override
  State<UpdateButton> createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  void onTap() {
    if (widget.sucess == false) {
      widget.update();
      AwesomeDialog(
        body: SizedBox(
          child: Text(
            'Thông tin không hợp lệ!!',
            style: MyTextStyles.content20MediumBlackSW,
          ),
        ),
        context: context,
        headerAnimationLoop: false,
        bodyHeaderDistance: 0,
        dialogType: DialogType.noHeader,
        padding: EdgeInsets.symmetric(
            horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
        btnCancel: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(MySizes.size5SW),
            decoration: BoxDecoration(
                color: MyColors.red,
                borderRadius: BorderRadius.circular(MySizes.size25SW)),
            child: Center(
              child: Text(
                'OK',
                style: MyTextStyles.content20BoldWhiteSW,
              ),
            ),
          ),
        ),
      ).show();
    } else {
      widget.update();
      AwesomeDialog(
        body: SizedBox(
          child: Text(
            'Cập nhật thành công!!',
            style: MyTextStyles.content20MediumBlackSW,
          ),
        ),
        context: context,
        headerAnimationLoop: false,
        bodyHeaderDistance: 0,
        dialogType: DialogType.noHeader,
        padding: EdgeInsets.symmetric(
            horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
        btnOk: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(MySizes.size5SW),
            decoration: BoxDecoration(
                color: const Color(0xFF00CA71),
                borderRadius: BorderRadius.circular(MySizes.size25SW)),
            child: Center(
              child: Text(
                'OK',
                style: MyTextStyles.content20BoldWhiteSW,
              ),
            ),
          ),
        ),
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MySizes.size45SW,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.blue,
          borderRadius: BorderRadius.circular(MySizes.size25SW),
        ),
        child: Center(
          child: Text(
            'Lưu thay đổi',
            style: MyTextStyles.content20MediumWhiteSW,
          ),
        ),
      ),
    );
  }
}
