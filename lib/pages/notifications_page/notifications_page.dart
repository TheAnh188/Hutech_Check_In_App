import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/bottom_bar_controller.dart';
import 'package:hutech_check_in_app/data/drawer_check.dart';
import 'package:hutech_check_in_app/data/notification.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/notification_list_tile.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    String? route = ModalRoute.of(context)?.settings.name;
    List<Notificationn> list = Provider.of<NotificationList>(context)
        .generate(Provider.of<SubjectList>(context).initEnrolledSubjects());
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              'Thông Báo',
              style: MyTextStyles.content25MediumBlackSW,
            ),
            centerTitle: true,
            floating: true,
            pinned: false,
            snap: false,
            scrolledUnderElevation: 0,
            toolbarHeight: MySizes.size85SW,
            leadingWidth: MySizes.size65SW,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: const BackArrowButton(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: Provider.of<SubjectList>(context)
                    .initEnrolledSubjects()
                    .length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<BottomBarController>(context, listen: false)
                          .getPageController
                          .jumpToPage(2);
                      setState(() {
                        Provider.of<DrawerCheck>(context, listen: false)
                            .setIsChecked = true;
                        list[index].setIsChecked = true;
                      });
                      Timer.periodic(const Duration(milliseconds: 350),
                          (timer) {
                        list[index]
                            .getSubject
                            .getKey
                            .currentState
                            ?.onTapListTile(route);
                        timer.cancel();
                      });
                    },
                    child: NotificationListTile(
                      subject: list[index].getSubject,
                      index: list[index].getIsChecked,
                    ),
                  );
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
