import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class GroupIntroduction extends StatelessWidget {
  const GroupIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    Subject subject = ModalRoute.of(context)?.settings.arguments as Subject;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        shadowColor: MyColors.grey,
        elevation: 5,
        centerTitle: true,
        title: Text(
          'Giới thiệu',
          style: MyTextStyles.content22RegularBlack,
        ),
        toolbarHeight: 85.h,
        leading: IconButton(
          style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(MyIcons.backArrow),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên lớp',
              style: MyTextStyles.content20MediumBlue,
            ),
            Text(
              subject.getTitle,
              style: MyTextStyles.content16RegularBlack,
            ),
            SizedBox(height: 20.h),
            Text(
              'Giảng viên hướng dẫn',
              style: MyTextStyles.content20MediumBlue,
            ),
            Text(
              subject.getLecturer,
              style: MyTextStyles.content16RegularBlack,
            )
          ],
        ),
      ),
    );
  }
}
