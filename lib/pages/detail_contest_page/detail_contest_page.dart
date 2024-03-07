import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/fade_animation.dart';
import 'package:hutech_check_in_app/data/assignment.dart';
import 'package:hutech_check_in_app/data/contest.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/assignment_list_tile.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/category.dart';
import 'package:hutech_check_in_app/widgets/ranking_list_tile.dart';
import 'package:hutech_check_in_app/widgets/ranking_widget.dart';

class DetailContestPage extends StatefulWidget {
  const DetailContestPage({super.key});

  @override
  State<DetailContestPage> createState() => _DetailContestPageState();
}

class _DetailContestPageState extends State<DetailContestPage> {
  final List _categories = ['Bài tập', 'Bảng kết quả'];
  final List _icons = [MyIcons.assignment, MyIcons.rank];
  int _selectedCategory = 0;

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

  @override
  Widget build(BuildContext context) {
    Contest contest = ModalRoute.of(context)?.settings.arguments as Contest;
    return Scaffold(
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
              leading: const BackArrowButton(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySizes.size25SW),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${contest.getTitle}',
                          style: MyTextStyles.content20MediumBlueSW,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: MySizes.size15SW),
                        SizedBox(
                          height: MySizes.size45SW,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _categories.length,
                            itemBuilder: (context, index) => FadeAnimation(
                              0.2,
                              0,
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = index;
                                  });
                                },
                                child: Category(
                                  title: _categories[index],
                                  icon: _icons[index],
                                  isSelected: index == _selectedCategory,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MySizes.size15SW),
                  _selectedCategory == 0
                      ? Column(
                          children:
                              assignmentWidgets(AssignmentList().generate()),
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RankingWidget(
                                  height: MySizes.size130SW,
                                  path: 'assets/images/silver-medal.png',
                                  lastName: 'Anh',
                                  totalPoint: 210,
                                  ranking: 2,
                                  color: MyColors.lightGreyAccent,
                                  style: MyTextStyles.content90BoldWhiteSW,
                                ),
                                RankingWidget(
                                  height: MySizes.size160SW,
                                  path: 'assets/images/gold-medal.png',
                                  lastName: 'Đoan',
                                  totalPoint: 326,
                                  ranking: 1,
                                  color: MyColors.greyAccent,
                                  style: MyTextStyles.content100BoldWhiteSW,
                                ),
                                RankingWidget(
                                  height: MySizes.size110SW,
                                  path: 'assets/images/bronze-medal.png',
                                  lastName: 'Nguyễn',
                                  totalPoint: 204,
                                  ranking: 3,
                                  color: MyColors.lightGreyAccent,
                                  style: MyTextStyles.content80BoldWhiteSW,
                                ),
                              ],
                            ),
                            SizedBox(height: MySizes.size20SW),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MySizes.size5SW),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: MySizes.size20SW),
                                decoration: BoxDecoration(
                                  color: MyColors.lightBlue.withOpacity(.2),
                                  borderRadius:
                                      BorderRadius.circular(MySizes.size18SW),
                                ),
                                child: const Column(
                                  children: [
                                    RankingListTile(
                                        studentName: 'Nguyễn Văn A',
                                        ranking: 4),
                                    RankingListTile(
                                        studentName: 'Hoàng Thị B', ranking: 5),
                                    RankingListTile(
                                        studentName: 'Trần Văn C', ranking: 6),
                                    RankingListTile(
                                        studentName: 'Nguyễn Văn C',
                                        ranking: 7),
                                    RankingListTile(
                                        studentName: 'Vũ Văn D', ranking: 8),
                                    RankingListTile(
                                        studentName: 'Đặng Văn E', ranking: 9),
                                    RankingListTile(
                                        studentName: 'Trần Văn F', ranking: 10),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: MySizes.size20SW),
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
