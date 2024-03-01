import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class AccountListTile extends StatelessWidget {
  final IconData iconData;
  final String title;

  const AccountListTile(
      {super.key, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MySizes.size20SW, vertical: MySizes.size8SW),
      child: Row(
        children: [
          CircleAvatar(
            radius: MySizes.size20SW,
            backgroundColor: MyColors.lightGrey,
            child: Icon(
              iconData,
              size: MySizes.size24SW,
              color: MyColors.black,
            ),
          ),
          SizedBox(width: MySizes.size10SW),
          Expanded(
            child: Text(
              title,
              style: MyTextStyles.content18MediumBlackSW,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
