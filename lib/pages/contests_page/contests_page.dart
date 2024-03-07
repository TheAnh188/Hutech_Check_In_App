import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/contest.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/contest_widget.dart';

class ContestsPage extends StatefulWidget {
  const ContestsPage({super.key});

  @override
  State<ContestsPage> createState() => _ContestsPageState();
}

class _ContestsPageState extends State<ContestsPage> {
  List<Widget> contestWidgets(
    List<Contest> list,
  ) {
    return list.map((index) {
      return ContestWidget(
        contest: index,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(
                'Cuộc Thi',
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
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    contestWidgets(ContestList().initContests()))),
          ],
        ),
      ),
    );
  }
}
