import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hutech_check_in_app/animation/fade_animation.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/utils/texts.dart';
import 'package:hutech_check_in_app/widgets/contest_home_widget.dart';
import 'package:hutech_check_in_app/widgets/indicator.dart';
import 'package:hutech_check_in_app/widgets/introduction.dart';
import 'package:hutech_check_in_app/widgets/list_view_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _pageController;
  late bool _endPoint;
  late int _pageIndex;
  late AnimationController _clickController;
  late Animation<double> _clickAnimation;
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

    _clickController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _clickAnimation =
        Tween<double>(begin: 1.0, end: 0.9).animate(_clickController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _clickController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              Navigator.pushNamed(context, '/check_in_home');
            }
          });
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.amber,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ScaleTransition(
        scale: _clickAnimation,
        child: FloatingActionButton(
          onPressed: () {
            _clickController.forward();
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                stops: [0.3, 1],
                colors: [MyColors.lightBlueAccent, MyColors.blue],
              ),
            ),
            child: Icon(
              MyIcons.qr,
              size: MySizes.size40,
              color: MyColors.white.withOpacity(.7),
            ),
          ),
        ),
      ),
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
                                          hideSnackBar(context);
                                          Navigator.pushNamed(
                                              context, '/notification');
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
                                                // height: 0.0035.sw,
                                                // height: 0.00205078125.sh,
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
                        Transform.translate(
                          offset: Offset(
                              (((size.width / 2) - MySizes.size20SW) -
                                  ((MySizes.size24SW * 5 + MySizes.size20SW) /
                                      2)),
                              (size.height * -0.04)),
                          child: SizedBox(
                            height: MySizes.size5SW,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: _items.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    _pageIndex = index;
                                  });
                                  _pageController.animateToPage(
                                    index,
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    curve: Curves.linearToEaseOut,
                                  );
                                  _resetAutoChangePage();
                                },
                                child:
                                    Indicator(isSelected: index == _pageIndex),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MySizes.size30SW),
                        const ContestHomeWidget(
                          path: Images.contest1,
                          text: Texts.contestTitle1,
                        ),
                        SizedBox(height: MySizes.size30SW),
                        const ContestHomeWidget(
                          path: Images.contest2,
                          text: Texts.contestTitle2,
                        ),
                        SizedBox(height: MySizes.size30SW),
                        const ContestHomeWidget(
                          path: Images.contest3,
                          text: Texts.contestTitle3,
                        ),
                        SizedBox(height: MySizes.size30SW),
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
}
