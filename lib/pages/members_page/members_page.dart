import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/group_drawer.dart';
import 'package:hutech_check_in_app/widgets/member_widget.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  var key = GlobalKey<ScaffoldState>();

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: const GroupDrawer(),
      body: RefreshIndicator(
        edgeOffset: MySizes.size50SW,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        displacement: MySizes.size50SW,
        strokeWidth: MySizes.size2SW,
        backgroundColor: MyColors.blue,
        color: MyColors.white,
        onRefresh: _refresh,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySizes.size20SW),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sinh viên',
                          style: TextStyle(
                              fontSize: MySizes.size30SW,
                              fontWeight: FontWeight.w500,
                              color: MyColors.blue),
                        ),
                        Divider(
                          color: MyColors.blueGrey,
                          height: MySizes.size12SW,
                          thickness: MySizes.size1SW,
                        ),
                        const MemberWidget(),
                        const MemberWidget(),
                        const MemberWidget(),
                        const MemberWidget(),
                        const MemberWidget(),
                        const MemberWidget(),
                        const MemberWidget(),
                        const MemberWidget(),
                        const MemberWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
