import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/fade_animation.dart';
import 'package:hutech_check_in_app/animation/loading.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/group_drawer.dart';
import 'package:hutech_check_in_app/widgets/history_list_tile.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  late bool _isPressed;
  var key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _isPressed = false;
  }

  void _onTap() async {
    await loading();
    await dissmis();
    if (context.mounted) {
      Navigator.pushNamed(context, '/qr');
    }
    setState(() {
      _isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: const GroupDrawer(),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: Text(
                  'Lịch sử điểm danh',
                  style: MyTextStyles.content22MediumBlackSW,
                ),
                floating: true,
                pinned: false,
                snap: false,
                scrolledUnderElevation: 0,
                toolbarHeight: MySizes.size85SW,
                leadingWidth: MySizes.size65SW,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: IconButton(
                  icon: Icon(
                    MyIcons.menu,
                    size: MySizes.size24SW,
                  ),
                  onPressed: () => key.currentState?.openDrawer(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // historyListTile(),
                    // historyListTile(),
                    // historyListTile(),
                    _isPressed
                        ? const FadeAnimation(1, 0, HistoryListTile())
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            bottom: MySizes.size50SW,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: MySizes.size30SW),
                height: MySizes.size50SW,
                child: ElevatedButton(
                  onPressed: !_isPressed ? _onTap : null,
                  style: ElevatedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: MyColors.blue,
                    disabledBackgroundColor: MyColors.grey.withOpacity(.7),
                  ),
                  child: Center(
                    child: Text(
                      !_isPressed ? 'Điểm danh' : 'Đã điểm danh',
                      style: MyTextStyles.content20MediumWhiteSW,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
