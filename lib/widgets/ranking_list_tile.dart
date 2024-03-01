import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class RankingListTile extends StatelessWidget {
  final String studentName;
  final int ranking;
  const RankingListTile(
      {super.key, required this.studentName, required this.ranking});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.size15SW),
        ),
        margin: EdgeInsets.only(
          left: MySizes.size20SW,
          right: MySizes.size20SW,
          bottom: MySizes.size5SW,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
          child: Row(
            children: [
              Container(
                width: MySizes.size30SW,
                height: MySizes.size30SW,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(MySizes.size15SW),
                  border: Border.all(
                    color: MyColors.lightGrey,
                    width: MySizes.size2SW,
                  ),
                ),
                child: Center(
                    child: Text(
                  '$ranking',
                  style: MyTextStyles.content14MediumGreySW,
                )),
              ),
              SizedBox(width: MySizes.size10SW),
              Text(
                studentName,
                style: MyTextStyles.content17RegularBlackSW,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ));
  }
}
