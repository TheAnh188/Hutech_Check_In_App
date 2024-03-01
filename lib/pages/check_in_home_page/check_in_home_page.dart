import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/check_in_widget.dart';
import 'package:provider/provider.dart';

class CheckInHomePage extends StatefulWidget {
  const CheckInHomePage({super.key});

  @override
  State<CheckInHomePage> createState() => _CheckInHomePageState();
}

class _CheckInHomePageState extends State<CheckInHomePage> {
  List<Widget> checkInWidgets(
    List<Subject> list,
  ) {
    return list.map((index) {
      return CheckInWidget(
        subjectTitle: index.getTitle,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              'Danh sách nhóm lớp',
              style: MyTextStyles.content25MediumBlackSW,
            ),
            floating: true,
            pinned: false,
            snap: false,
            scrolledUnderElevation: 0,
            toolbarHeight: MySizes.size85SW,
            leadingWidth: MySizes.size65SW,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: const BackArrowButton(),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: IconButton(
                  style:
                      const ButtonStyle(splashFactory: NoSplash.splashFactory),
                  onPressed: () {},
                  icon:
                      Icon(FontAwesomeIcons.circleInfo, size: MySizes.size24SW),
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(left: MySizes.size10SW),
                  child: Column(
                    // CheckInWidget(
                    //     subjectTitle:
                    //         'Thực hành lập trình trên môi trường Windows'),
                    // CheckInWidget(
                    //     subjectTitle: 'Thực hành an toàn máy chủ Windows'),
                    // CheckInWidget(subjectTitle: 'Thực hành lý thuyết đồ thị'),
                    // CheckInWidget(subjectTitle: 'Thực hành lập trình động'),
                    children: checkInWidgets(
                        Provider.of<SubjectList>(context, listen: false)
                            .initEnrolledSubjects()),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
