import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hutech_check_in_app/data/bottom_bar_controller.dart';
import 'package:hutech_check_in_app/data/email.dart';
import 'package:hutech_check_in_app/data/notification.dart';
import 'package:hutech_check_in_app/data/password.dart';
import 'package:hutech_check_in_app/data/phone_number.dart';
import 'package:hutech_check_in_app/pages/account_page/account_page.dart';
import 'package:hutech_check_in_app/pages/contests_page/contests_page.dart';
import 'package:hutech_check_in_app/pages/course_page/course_page.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/data/drawer_check.dart';
import 'package:hutech_check_in_app/pages/groups_page/groups_page.dart';
import 'package:hutech_check_in_app/pages/home_page/home_page.dart';
import 'package:hutech_check_in_app/pages/login_page/login_page.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        designSize: Size(size.width, size.height),
        splitScreenMode: true,
        minTextAdapt: true);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DrawerCheck(),
        ),
        ChangeNotifierProvider(
          create: (context) => SubjectList(),
        ),
        ChangeNotifierProvider(
          create: (context) => Subject(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneNumber(),
        ),
        ChangeNotifierProvider(
          create: (context) => Password(),
        ),
        ChangeNotifierProvider(
          create: (context) => Email(),
        ),
        ChangeNotifierProvider(
          create: (context) => Notificationn(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationList(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomBarController(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: MyRouter.onGenerateRoute,
        theme: ThemeData(
          listTileTheme: ListTileThemeData(
            horizontalTitleGap: MySizes.size10SW,
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: MySizes.size16SW),
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          ),
        ),
        title: 'Hutech Check In',
        debugShowCheckedModeBanner: false,
        home: const CheckInApp(),
        // home: const Login(),
      ),
    );
  }
}

class CheckInApp extends StatefulWidget {
  const CheckInApp({super.key});

  @override
  State<CheckInApp> createState() => _CheckInAppState();
}

class _CheckInAppState extends State<CheckInApp> with TickerProviderStateMixin {
  late final _pages = [
    const HomePage(),
    const CoursePage(),
    const GroupsPage(),
    const ContestsPage(),
    const AccountPage()
  ];

  late int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<BottomBarController>(context, listen: false)
        .getPageController
        .dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        designSize: Size(size.width, size.height),
        splitScreenMode: true,
        minTextAdapt: true);
    return Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: Provider.of<BottomBarController>(context, listen: false)
              .getPageController,
          // controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            setState(() {
              _index = index;
            });
          },
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: MyTextStyles.content12MediumBlackSW,
          selectedLabelStyle: MyTextStyles.content12MediumBlackSW,
          iconSize: MySizes.size20SW,
          backgroundColor: MyColors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: MyColors.grey,
          onTap: (index) {
            Provider.of<BottomBarController>(context, listen: false)
                .getPageController
                .jumpToPage(index);
            // _pageController.jumpToPage(index);
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(MyIcons.house),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyIcons.course),
              label: 'Khóa học',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyIcons.group),
              label: 'Nhóm lớp',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyIcons.contest),
              label: 'Cuộc thi',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyIcons.account),
              label: 'Tài khoản',
            )
          ],
        ));
  }
}
