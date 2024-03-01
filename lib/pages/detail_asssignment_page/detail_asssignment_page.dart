import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/assignment.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';

class DetailAssignmentPage extends StatefulWidget {
  const DetailAssignmentPage({super.key});

  @override
  State<DetailAssignmentPage> createState() => _DetailAssignmentPageState();
}

class _DetailAssignmentPageState extends State<DetailAssignmentPage> {
  @override
  Widget build(BuildContext context) {
    Assignment assignment =
        ModalRoute.of(context)?.settings.arguments as Assignment;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: Text(
                  'Bài tập',
                  style: MyTextStyles.content25MediumBlackSW,
                ),
                floating: true,
                pinned: false,
                snap: false,
                scrolledUnderElevation: 0,
                toolbarHeight: MySizes.size85SW,
                leadingWidth: MySizes.size65SW,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: const BackArrowButton(),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: MySizes.size10SW),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(MyIcons.more, size: MySizes.size24SW),
                    ),
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: MySizes.size25SW),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${assignment.getTitle}',
                            style: MyTextStyles.content20MediumBlueSW,
                          ),
                          Text(
                            'Hạn nộp: 12/2',
                            style: MyTextStyles.content16RegularBlackSW,
                          ),
                          SizedBox(height: MySizes.size10SW),
                          Text(
                            'Mô tả yêu cầu',
                            style: MyTextStyles.content22MediumBlackSW,
                          ),
                          SizedBox(height: MySizes.size10SW),
                          Text(
                            'Sau khi kết thúc kỳ thi học kỳ 1A, Khoa Công nghệ thông tin phân công cho thầy Khuyên châm điểm bài thi trắc nghiệm học phần Đại số tuyến tính (DSTT).',
                            style: MyTextStyles.content17RegularBlackSW,
                          ),
                          SizedBox(height: MySizes.size10SW),
                          Text(
                            'Đề thi học phần ĐDSTT gồm có 2 câu hỏi trắc nghiệm, mỗi câu có 4 phương án trả lời (đánh số từ A đến D) Đáp án đúng cho từng cầu được cho sẵn.',
                            style: MyTextStyles.content17RegularBlackSW,
                          ),
                          SizedBox(height: MySizes.size10SW),
                          Text(
                            'Viết chương trình giúp thầy Khuyên tỉnh điểm cho từng bài thi dựa trên kết quả làm bài của sinh viên.',
                            style: MyTextStyles.content17RegularBlackSW,
                          )
                        ],
                      ),
                    ),
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
                decoration: BoxDecoration(
                  color: MyColors.blue,
                  borderRadius: BorderRadius.circular(MySizes.size25SW),
                ),
                child: Center(
                  child: Text(
                    'Chưa hoàn thành',
                    style: MyTextStyles.content20MediumWhiteSW,
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
