import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hutech_check_in_app/data/assignment.dart';
import 'package:hutech_check_in_app/data/notification.dart';
import 'package:hutech_check_in_app/data/subject.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/assignment_list_tile.dart';
import 'package:hutech_check_in_app/widgets/group_drawer.dart';
import 'package:provider/provider.dart';

class AssignmentsPage extends StatefulWidget {
  const AssignmentsPage({super.key});

  @override
  State<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage>
    with TickerProviderStateMixin {
  var key = GlobalKey<ScaffoldState>();
  late AnimationController _clickController;
  late Animation<double> _clickAnimation;

  @override
  void initState() {
    super.initState();

    _clickController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _clickAnimation = Tween<double>(
            begin: MySizes.size135SW, end: MySizes.size300SW)
        .animate(_clickController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            Provider.of<Notificationn>(context, listen: false).setIsSeen = true;
          });
        }
      });
  }

  List<Widget> assignmentWidgets(
    List<Assignment> list,
  ) {
    return list.map((index) {
      return AssignmentListTile(
        assignment: index,
      );
    }).toList();
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 1));
  }

  List<Widget> texts(
    List<Notificationn> list,
    double padding,
  ) {
    return list.map((index) {
      return Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: Text(
          index.getContent,
          style: MyTextStyles.content18MediumBlackSW,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Notificationn> list =
        NotificationList().generate(SubjectList().initEnrolledSubjects());

    Subject subject = ModalRoute.of(context)?.settings.arguments as Subject;
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
                  child: Row(
                    children: [
                      IconButton(
                        style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory),
                        onPressed: () {
                          Navigator.pushNamed(context, '/group_introduction',
                              arguments: subject);
                        },
                        icon: Icon(
                          MyIcons.infoOutline,
                          size: MySizes.size24SW,
                        ),
                      ),
                      IconButton(
                        style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory),
                        onPressed: () {
                          showModalBottomSheet(
                            // showDragHandle: true,
                            constraints: BoxConstraints.expand(
                              width: 1.sw,
                              height: 0.16.sh + MySizes.size25SW,
                            ),
                            context: context,
                            builder: (builder) {
                              return Container(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Container(
                                      height: MySizes.size25SW,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: ListTile(
                                          minVerticalPadding: MySizes.size10SW,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/ranking');
                                          },
                                          leading: Icon(MyIcons.rank,
                                              size: MySizes.size24SW),
                                          title: Text(
                                            'Xếp hạng',
                                            style: MyTextStyles
                                                .content18RegularBlackSW,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: ListTile(
                                          minVerticalPadding: MySizes.size10SW,
                                          leading: Icon(MyIcons.message,
                                              size: MySizes.size24SW),
                                          title: Text(
                                            'Thắc mắc',
                                            style: MyTextStyles
                                                .content18RegularBlackSW,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(MyIcons.more, size: MySizes.size24SW),
                      )
                    ],
                  ),
                )
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      // Container(
                      //   margin:
                      //       EdgeInsets.symmetric(horizontal: MySizes.size20SW),
                      //   height: MySizes.size120SW,
                      //   padding: EdgeInsets.only(
                      //       left: MySizes.size10SW,
                      //       right: MySizes.size10SW,
                      //       bottom: MySizes.size20SW),
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(MySizes.size15SW),
                      //     color: Colors.lightBlueAccent,
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         subject.getTitle,
                      //         overflow: TextOverflow.ellipsis,
                      //         style: MyTextStyles.content20MediumBlackSW,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      AnimatedBuilder(
                        animation: _clickController,
                        builder: (context, child) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MySizes.size20SW),
                          child: GestureDetector(
                            onTap: () {
                              if (_clickController.status ==
                                      AnimationStatus.forward ||
                                  _clickController.status ==
                                      AnimationStatus.completed) {
                                _clickController.reverse();
                              } else {
                                _clickController.forward();
                              }
                            },
                            child: Container(
                              height: _clickAnimation.value,
                              padding: EdgeInsets.all(MySizes.size20SW),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: MyColors.lightGreyAccent,
                                    blurRadius: MySizes.size10SW,
                                    offset: Offset(0, MySizes.size10SW),
                                  ),
                                ],
                                color: MyColors.white,
                                borderRadius:
                                    BorderRadius.circular(MySizes.size20SW),
                                border: Border.all(
                                  color: MyColors.lightGrey,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '7 giờ trước',
                                        style:
                                            MyTextStyles.content14MediumGreySW,
                                        maxLines: 1,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            _clickController.status ==
                                                        AnimationStatus
                                                            .forward ||
                                                    _clickController.status ==
                                                        AnimationStatus
                                                            .completed
                                                ? 'Ẩn bớt'
                                                : 'Xem tất cả',
                                            style: MyTextStyles
                                                .content14MediumBleSW,
                                            maxLines: 1,
                                          ),
                                          SizedBox(width: MySizes.size10SW),
                                          CircleAvatar(
                                            backgroundColor: MyColors.blue,
                                            radius: MySizes.size15SW,
                                            child: Text(
                                              Provider.of<Notificationn>(
                                                context,
                                              ).getIsSeen
                                                  ? '0'
                                                  : '4',
                                              style: MyTextStyles
                                                  .content15MediumWhiteSW,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySizes.size10SW),
                                  Expanded(
                                    child: _clickController.status ==
                                                AnimationStatus.forward ||
                                            _clickController.status ==
                                                AnimationStatus.completed ||
                                            _clickController.status ==
                                                AnimationStatus.reverse
                                        ? SingleChildScrollView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            child: Column(
                                              children:
                                                  texts(list, MySizes.size10SW),
                                            ),
                                          )
                                        : texts(list, 0)[0],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MySizes.size30SW),
                      Column(
                        children:
                            assignmentWidgets(AssignmentList().generate()),
                      ),
                    ],
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
