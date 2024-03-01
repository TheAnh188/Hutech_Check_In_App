import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/ranking_list_tile.dart';
import 'package:hutech_check_in_app/widgets/ranking_widget.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text('Bảng xếp hạng',
                style: MyTextStyles.content22MediumBlackSW),
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
                      color: MyColors.lightBlueAccent,
                      style: MyTextStyles.content90BoldWhiteSW,
                    ),
                    RankingWidget(
                      height: MySizes.size160SW,
                      path: 'assets/images/gold-medal.png',
                      lastName: 'Đoan',
                      totalPoint: 326,
                      ranking: 1,
                      color: MyColors.lightBlue,
                      style: MyTextStyles.content100BoldWhiteSW,
                    ),
                    RankingWidget(
                      height: MySizes.size110SW,
                      path: 'assets/images/bronze-medal.png',
                      lastName: 'Nguyễn',
                      totalPoint: 204,
                      ranking: 3,
                      color: MyColors.lightBlueAccent,
                      style: MyTextStyles.content80BoldWhiteSW,
                    ),
                  ],
                ),
                SizedBox(height: MySizes.size20SW),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySizes.size5SW),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: MySizes.size20SW),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(.2),
                      borderRadius: BorderRadius.circular(MySizes.size18SW),
                    ),
                    child: const Column(
                      children: [
                        RankingListTile(
                            studentName: 'Nguyễn Văn A', ranking: 4),
                        RankingListTile(studentName: 'Hoàng Thị B', ranking: 5),
                        RankingListTile(studentName: 'Trần Văn C', ranking: 6),
                        RankingListTile(
                            studentName: 'Nguyễn Văn C', ranking: 7),
                        RankingListTile(studentName: 'Vũ Văn D', ranking: 8),
                        RankingListTile(studentName: 'Đặng Văn E', ranking: 9),
                        RankingListTile(studentName: 'Trần Văn F', ranking: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MySizes.size20SW),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
