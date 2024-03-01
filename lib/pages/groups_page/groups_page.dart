import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/data/drawer_check.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/group_drawer.dart';
import 'package:hutech_check_in_app/widgets/group_widget.dart';
import 'package:provider/provider.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  var key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  List<Widget> groupWidgets(
    List<Subject> list,
  ) {
    return list.map((index) {
      return GroupWidget(
        key: index.getKey,
        subject: index,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: const GroupDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(
                'Nhóm/Lớp',
                style: MyTextStyles.content30MediumBlackSW,
              ),
              centerTitle: true,
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
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: MySizes.size10SW),
                  child: IconButton(
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () {},
                    icon: Icon(MyIcons.globe, size: MySizes.size30SW),
                  ),
                )
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  Provider.of<DrawerCheck>(context).getIsChecked
                      ? groupWidgets(Provider.of<SubjectList>(context)
                          .initEnrolledSubjects())
                      : groupWidgets(Provider.of<SubjectList>(context)
                          .initArchivedSubjects())),
            ),
          ],
        ),
      ),
    );
  }
}
