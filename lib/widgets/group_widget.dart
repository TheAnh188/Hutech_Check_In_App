import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class GroupWidget extends StatefulWidget {
  final Subject subject;

  const GroupWidget({super.key, required this.subject});

  @override
  State<GroupWidget> createState() => GroupWidgetState();
}

class GroupWidgetState extends State<GroupWidget> {
  void onTapListTile(String? route) {
    if (route == '/detail_group' || route == '/notification') {
      Navigator.pushReplacementNamed(context, '/detail_group',
          arguments: widget.subject);
    } else {
      onTap();
    }
  }

  void onTap() {
    Navigator.pushNamed(context, '/detail_group', arguments: widget.subject);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.size15SW),
        ),
        margin: EdgeInsets.fromLTRB(
            MySizes.size20SW, 0, MySizes.size20SW, MySizes.size10SW),
        shadowColor: MyColors.lightGrey,
        elevation: MySizes.size10SW,
        child: Container(
          padding: EdgeInsets.all(MySizes.size10SW),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.subject.getTitle,
                style: MyTextStyles.content28MediumBlueSW,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.subject.getSubTitle,
                style: MyTextStyles.content17RegularBlackSW,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: MySizes.size40SW),
              Text(
                widget.subject.getLecturer,
                style: MyTextStyles.content16RegularBlackSW,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
