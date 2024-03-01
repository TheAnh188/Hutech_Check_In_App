import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySizes.size15SW),
      ),
      margin: EdgeInsets.only(bottom: MySizes.size8SW),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MySizes.size20SW, vertical: MySizes.size15SW),
        child: Row(
          children: [
            Icon(
              MyIcons.account,
              size: MySizes.size20SW,
            ),
            SizedBox(width: MySizes.size10SW),
            Expanded(
              child: Text(
                'Vũ Thế Anh',
                style: MyTextStyles.content17RegularBlackSW,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
