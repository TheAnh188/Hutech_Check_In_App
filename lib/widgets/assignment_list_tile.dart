import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/assignment.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class AssignmentListTile extends StatefulWidget {
  final Assignment assignment;

  const AssignmentListTile({
    super.key,
    required this.assignment,
  });

  @override
  State<AssignmentListTile> createState() => _AssignmentListTileState();
}

class _AssignmentListTileState extends State<AssignmentListTile> {
  void _onTap() {
    Navigator.pushNamed(context, '/detail_assignment',
        arguments: widget.assignment);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.size15SW),
        ),
        margin: EdgeInsets.only(
          left: MySizes.size20SW,
          right: MySizes.size20SW,
          bottom: MySizes.size8SW,
        ),
        child: Container(
          height: MySizes.size85SW,
          alignment: Alignment.center,
          child: ListTile(
            minVerticalPadding: 20,
            leading: Container(
              padding: EdgeInsets.all(MySizes.size5SW),
              decoration: const BoxDecoration(
                  color: MyColors.blue, shape: BoxShape.circle),
              child: Icon(
                MyIcons.assignmentOutlined,
                size: MySizes.size20SW,
                color: MyColors.white,
              ),
            ),
            title: Text(
              widget.assignment.getTitle,
              style: MyTextStyles.content14MediumBlackSW,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              widget.assignment.getCorrectQuantity,
              style: MyTextStyles.content12MediumBlackSW,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
