import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hutech_check_in_app/pages/assignments_page/assignments_page.dart';
import 'package:hutech_check_in_app/pages/check_in_page/check_in_page.dart';
import 'package:hutech_check_in_app/pages/members_page/members_page.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class DetailGroupPage extends StatefulWidget {
  const DetailGroupPage({super.key});

  @override
  State<DetailGroupPage> createState() => _DetailGroupPageState();
}

class _DetailGroupPageState extends State<DetailGroupPage> {
  late PageController _pageController;
  late int _index;
  late final _groupPages = [
    const AssignmentsPage(),
    const CheckInPage(),
    const MembersPage(),
  ];

  @override
  void initState() {
    super.initState();
    _index = 0;
    _pageController = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        itemCount: _groupPages.length,
        itemBuilder: (context, index) => _groupPages[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: MyTextStyles.content12MediumBlackSW,
        selectedLabelStyle: MyTextStyles.content12MediumBlackSW,
        iconSize: MySizes.size20SW,
        backgroundColor: MyColors.white,
        selectedItemColor: MyColors.blue,
        unselectedItemColor: MyColors.grey,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Bài tập',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.qrcode),
            label: 'Điểm danh',
          ),
          BottomNavigationBarItem(
            icon: Icon(MyIcons.group),
            label: 'Thành viên',
          ),
        ],
      ),
    );
  }
}
