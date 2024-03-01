import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/notification_check.dart';
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
    List list = Provider.of<NotificationList>(context, listen: false).generate(
        Provider.of<SubjectList>(context, listen: false)
            .initEnrolledSubjects()
            .length);
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
                  Provider.of<NotificationList>(context).generate(
                      Provider.of<SubjectList>(context)
                          .initEnrolledSubjects()
                          .length);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        list[index].setIsChecked = true;
                      });
                    },
                    child: NotificationListTile(
                      subject: Provider.of<SubjectList>(context)
                          .initEnrolledSubjects()[index],
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
