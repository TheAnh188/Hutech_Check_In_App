import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class NotificationListTile extends StatefulWidget {
  final Subject subject;
  final bool index;
  const NotificationListTile(
      {super.key, required this.subject, required this.index});

  @override
  State<NotificationListTile> createState() => _NotificationListTileState();
}

class _NotificationListTileState extends State<NotificationListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.index == false ? MyColors.blue.withOpacity(.1) : null,
      padding: EdgeInsets.symmetric(
          horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: MyColors.lightGrey,
            radius: MySizes.size35SW,
            child: Icon(
              MyIcons.account,
              size: MySizes.size35SW,
              color: MyColors.white,
            ),
          ),
          SizedBox(width: MySizes.size10SW),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: MyTextStyles.content18BoldBlackSW,
                children: [
                  TextSpan(text: widget.subject.getLecturer + ' '),
                  TextSpan(
                      text: 'đã đăng một thông báo tại lớp',
                      style: MyTextStyles.content18RegularBlackSW),
                  TextSpan(text: ' ${widget.subject.getTitle}'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
