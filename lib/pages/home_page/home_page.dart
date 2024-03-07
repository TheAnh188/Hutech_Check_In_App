import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hutech_check_in_app/animation/fade_animation.dart';
import 'package:hutech_check_in_app/data/bottom_bar_controller.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/utils/texts.dart';
import 'package:hutech_check_in_app/widgets/contest_home_widget.dart';
import 'package:hutech_check_in_app/widgets/indicator.dart';
import 'package:hutech_check_in_app/widgets/introduction.dart';
import 'package:hutech_check_in_app/widgets/list_view_item.dart';
import 'package:hutech_check_in_app/widgets/quick_access_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _pageController;
  late bool _endPoint;
  late int _pageIndex;
  late bool _isClicked;
  late Timer _timer;

  final _items = [
    const ListViewItem(path: Images.pic0, boxFit: BoxFit.cover),
    const ListViewItem(path: Images.pic1, boxFit: BoxFit.cover),
    const ListViewItem(path: Images.pic2, boxFit: BoxFit.cover),
    const ListViewItem(path: Images.pic3, boxFit: BoxFit.cover),
    const ListViewItem(path: Images.pic4, boxFit: BoxFit.cover),
  ];

  @override
  void initState() {
    super.initState();

    _pageIndex = 0;
    _pageController = PageController(initialPage: _pageIndex);
    _endPoint = false;
    _isClicked = false;
    _autoChangePage();
  }

  void _autoChangePage() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageIndex < _items.length - 1 && !_endPoint) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.linearToEaseOut);
      } else if (_pageIndex <= _items.length - 1) {
        setState(() {
          _endPoint = true;
        });
        _pageController.previousPage(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.linearToEaseOut);
        if (_pageIndex == 0) {
          setState(() {
            _endPoint = false;
          });
          _pageController.nextPage(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.linearToEaseOut);
        }
      } else {
        timer.cancel();
      }
    });
  }

  void _resetAutoChangePage() {
    _timer.cancel();
    _autoChangePage();
  }

  void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    setState(() {
      _isClicked = false;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void accessPage(String route, int? index) {
    if (route.isNotEmpty) {
      Timer.periodic(Duration(milliseconds: _isClicked ? 350 : 0), (timer) {
        Navigator.pushNamed(context, route);
        timer.cancel();
      });
    }
    if (index != null) {
      Timer.periodic(
          Duration(milliseconds: route.isNotEmpty || _isClicked ? 600 : 0),
          (timer) {
        Provider.of<BottomBarController>(context, listen: false)
            .getPageController
            .jumpToPage(index);
        timer.cancel();
      });
    }
    hideSnackBar(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: GestureDetector(
        onTap: () {
          hideSnackBar(context);
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      MySizes.size20SW,
                      MySizes.size30SW,
                      MySizes.size20SW,
                      0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MySizes.size80SW,
                              child: Image.asset(
                                Images.logo,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(15, 0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: MySizes.size5SW),
                                    child: AvatarGlow(
                                      glowCount: 1,
                                      glowColor: MyColors.lightBlue,
                                      duration: const Duration(seconds: 1),
                                      child: GestureDetector(
                                        onTap: () {
                                          accessPage('/notification', null);
                                        },
                                        child: Icon(
                                          MyIcons.notifications,
                                          color: MyColors.blue,
                                          size: MySizes.size26SW,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    style: const ButtonStyle(
                                        splashFactory: NoSplash.splashFactory),
                                    onPressed: () {
                                      if (!_isClicked) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.fixed,
                                            backgroundColor: MyColors.lightGrey,
                                            duration:
                                                const Duration(minutes: 10),
                                            padding: EdgeInsets.fromLTRB(
                                                MySizes.size20SW,
                                                0,
                                                MySizes.size20SW,
                                                MySizes.size10SW),
                                            content: const DefaultTextStyle(
                                              style: TextStyle(
                                                color: MyColors.black,
                                              ),
                                              child: Introduction(),
                                            ),
                                          ),
                                        );
                                        setState(() {
                                          _isClicked = true;
                                        });
                                      } else {
                                        hideSnackBar(context);
                                      }
                                    },
                                    icon: Icon(
                                      MyIcons.info,
                                      size: MySizes.size24SW,
                                      color: MyColors.black.withOpacity(.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MySizes.size15SW),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Truy cập nhanh',
                            style: MyTextStyles.content22MediumBlackSW,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySizes.size10SW),
                          padding: EdgeInsets.all(MySizes.size10SW),
                          decoration: BoxDecoration(
                            border: Border.all(color: MyColors.lightGreyAccent),
                            borderRadius:
                                BorderRadius.circular(MySizes.size15SW),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  accessPage('', 2);
                                },
                                child: const QuickAccessWidget(
                                  icon: MyIcons.group,
                                  title: 'Nhóm lớp',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  accessPage('/check_in_home', null);
                                },
                                child: const QuickAccessWidget(
                                  icon: FontAwesomeIcons.qrcode,
                                  title: 'Điểm danh',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  accessPage('', 3);
                                },
                                child: const QuickAccessWidget(
                                  icon: MyIcons.contest,
                                  title: 'Cuộc thi',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MySizes.size20SW),
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.5 / 1,
                              child: PageView.builder(
                                controller: _pageController,
                                physics: const BouncingScrollPhysics(),
                                onPageChanged: (index) {
                                  setState(() {
                                    _pageIndex = index;
                                  });
                                  _resetAutoChangePage();
                                },
                                itemCount: _items.length,
                                itemBuilder: (context, index) =>
                                    FadeAnimation(0, 0, _items[index]),
                                // _items[index],
                              ),
                            ),
                            Positioned(
                              bottom: MySizes.size15SW,
                              left: (((size.width / 2) - MySizes.size20SW) -
                                  ((MySizes.size24SW * 5 + MySizes.size20SW) /
                                      2)),
                              child: SizedBox(
                                width: 1.sw,
                                height: MySizes.size5SW,
                                child: Center(
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _items.length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          _pageIndex = index;
                                        });
                                        _pageController.animateToPage(
                                          index,
                                          duration: const Duration(
                                              milliseconds: 1500),
                                          curve: Curves.linearToEaseOut,
                                        );
                                        _resetAutoChangePage();
                                      },
                                      child: Indicator(
                                          isSelected: index == _pageIndex),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // ),
                          ],
                        ),
                        SizedBox(height: MySizes.size20SW),
                        const ContestHomeWidget(
                          path: Images.contest1,
                          text: Texts.contestTitle1,
                        ),
                        SizedBox(height: MySizes.size20SW),
                        const ContestHomeWidget(
                          path: Images.contest2,
                          text: Texts.contestTitle2,
                        ),
                        SizedBox(height: MySizes.size20SW),
                        const ContestHomeWidget(
                          path: Images.contest3,
                          text: Texts.contestTitle3,
                        ),
                        SizedBox(height: MySizes.size20SW),
                        const ContestHomeWidget(
                          path: Images.logo,
                          text: Texts.contestTitle4,
                        ),
                        const SizedBox(height: 500),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeColumn({IconData? icon, text}) {
    return Column(
      children: [
        Container(
            height: MySizes.size65SW,
            width: MySizes.size65SW,
            decoration: BoxDecoration(
              border: Border.all(
                width: MySizes.size8SW,
                color: Colors.grey.withOpacity(.2),
              ),
              color: MyColors.white,
              borderRadius: BorderRadius.circular(MySizes.size22SW),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: MyColors.blue,
                size: 30,
              ),
            )),
        SizedBox(height: MySizes.size10SW),
        Text(
          text,
          style: TextStyle(color: Colors.grey.shade700),
        )
      ],
    );
  }
}
