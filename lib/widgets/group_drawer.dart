import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/data/drawer_check.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:provider/provider.dart';

class GroupDrawer extends StatefulWidget {
  const GroupDrawer({super.key});

  @override
  State<GroupDrawer> createState() => _GroupDrawerState();
}

class _GroupDrawerState extends State<GroupDrawer> {
  late ExpansionTileController _controller1;
  late ExpansionTileController _controller2;
  @override
  void initState() {
    super.initState();
    _controller1 = ExpansionTileController();
    _controller2 = ExpansionTileController();
  }

  void changeSubject(String title) {
    Provider.of<Subject>(context, listen: false).setTitle = title;
  }

  List<Widget> expansionTileItems(
    List<Subject> list,
    bool isChecked,
  ) {
    return list.map((index) {
      return SizedBox(
        height: MySizes.size55SW,
        child: ListTile(
          minVerticalPadding: MySizes.size5SW,
          onTap: () {
            String? route = ModalRoute.of(context)?.settings.name;
            Provider.of<DrawerCheck>(context, listen: false).setIsChecked =
                isChecked;
            Navigator.pop(context);
            if (Provider.of<Subject>(context, listen: false).getTitle !=
                index.getTitle) {
              changeSubject(index.getTitle);
              Timer.periodic(const Duration(milliseconds: 350), (timer) {
                index.getKey.currentState?.onTapListTile(route);
                timer.cancel();
              });
            }
          },
          title: Text(
            index.getTitle,
            overflow: TextOverflow.ellipsis,
            style: MyTextStyles.content18RegularBlackSW,
          ),
        ),
      );
    }).toList();
  }

  void closeDrawer(bool value) {
    Provider.of<DrawerCheck>(context, listen: false).setIsChecked = value;
    Navigator.pop(context);
    Navigator.maybePop(context);
  }

  Color? setColor(bool value) {
    return value ? MyColors.blue : MyColors.black;
  }

  void expandExpansionTile(
      ExpansionTileController ec1, ExpansionTileController ec2) {
    if (ec1.isExpanded) {
      ec2.collapse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MySizes.size300SW,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding:
                EdgeInsets.fromLTRB(0, MySizes.size40SW, 0, MySizes.size30SW),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                minVerticalPadding: MySizes.size5SW,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: MySizes.size16SW),
                leading: Icon(MyIcons.group,
                    size: MySizes.size20SW, color: MyColors.black),
                title: Text(
                  'Nhóm/Lớp',
                  style: MyTextStyles.content32BoldBlackWS,
                ),
              ),
            ),
          ),
          ExpansionTile(
            controller: _controller1,
            collapsedBackgroundColor:
                Provider.of<DrawerCheck>(context).getIsChecked
                    ? MyColors.lightGrey
                    : null,
            shape: InputBorder.none,
            collapsedIconColor: MyColors.black,
            collapsedTextColor: MyColors.black,
            iconColor: setColor(Provider.of<DrawerCheck>(context).getIsChecked),
            textColor: setColor(Provider.of<DrawerCheck>(context).getIsChecked),
            tilePadding: EdgeInsets.only(
                left: 0, right: MySizes.size25SW, top: 0, bottom: 0),
            title: Container(
              height: MySizes.size65SW,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: ListTile(
                onTap: () {
                  closeDrawer(true);
                  changeSubject('');
                },
                minVerticalPadding: 0,
                title: Text(
                  'Đã tham gia',
                  style: TextStyle(
                      fontSize: MySizes.size25SW, fontFamily: 'Roboto-Medium'),
                ),
                leading: Icon(MyIcons.pen, size: MySizes.size20SW),
              ),
            ),
            trailing: Icon(Icons.arrow_drop_down, size: MySizes.size24SW),
            childrenPadding: EdgeInsets.only(left: MySizes.size5SW),
            onExpansionChanged: (isExpanded) {
              expandExpansionTile(
                _controller1,
                _controller2,
              );
            },
            children: expansionTileItems(
                Provider.of<SubjectList>(context).initEnrolledSubjects(), true),
          ),
          ExpansionTile(
            controller: _controller2,
            collapsedBackgroundColor:
                !Provider.of<DrawerCheck>(context).getIsChecked
                    ? MyColors.lightGrey
                    : null,
            shape: InputBorder.none,
            collapsedIconColor: MyColors.black,
            collapsedTextColor: MyColors.black,
            iconColor:
                setColor(!Provider.of<DrawerCheck>(context).getIsChecked),
            textColor:
                setColor(!Provider.of<DrawerCheck>(context).getIsChecked),
            tilePadding: EdgeInsets.only(
                left: 0, right: MySizes.size25SW, top: 0, bottom: 0),
            title: Container(
              height: MySizes.size65SW,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: ListTile(
                onTap: () {
                  closeDrawer(false);
                  changeSubject('');
                },
                minVerticalPadding: 0,
                leading: Icon(MyIcons.archive, size: MySizes.size20SW),
                title: Text(
                  'Đã lưu trữ',
                  style: TextStyle(
                      fontSize: MySizes.size25SW, fontFamily: 'Roboto-Medium'),
                ),
              ),
            ),
            trailing: Icon(Icons.arrow_drop_down, size: MySizes.size24SW),
            childrenPadding: EdgeInsets.only(left: MySizes.size5SW),
            onExpansionChanged: (isExpanded) {
              expandExpansionTile(_controller2, _controller1);
            },
            children: expansionTileItems(
                Provider.of<SubjectList>(context).initArchivedSubjects(),
                false),
          ),
        ],
      ),
    );
  }
}
