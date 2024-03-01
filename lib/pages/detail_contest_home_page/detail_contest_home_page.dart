import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/utils/texts.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/list_view_item.dart';

class DetailContestHomePage extends StatefulWidget {
  const DetailContestHomePage({super.key});

  @override
  State<DetailContestHomePage> createState() => _DetailContestHomePageState();
}

class _DetailContestHomePageState extends State<DetailContestHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            scrolledUnderElevation: 0,
            toolbarHeight: 85.h,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: const BackArrowButton(),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: IconButton(
                  style:
                      const ButtonStyle(splashFactory: NoSplash.splashFactory),
                  onPressed: () {},
                  icon: Icon(MyIcons.globe, size: MySizes.size30),
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Texts.contestTitle1,
                        style: MyTextStyles.content20BoldBlack,
                      ),
                      AspectRatio(
                        aspectRatio: 16.w / 9.h,
                        child: const ListViewItem(
                          path: Images.contest1,
                          boxFit: BoxFit.cover,
                          // boxFit: null,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        '🚀 Bạn là Tân binh mới của khoa Công nghệ Thông tin? Bạn muốn thể hiện khả năng và tiềm năng của mình? Hãy đăng ký tham gia ngay cuộc thi "Ươm mầm tài năng Công nghệ Thông tin 2023" - một sân chơi đặc biệt dành riêng cho các bạn sinh viên khoá 2023!',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        '🔥 Là sự kiện thường niên của Khoa CNTT, dành riêng cho các bạn tân sinh viên, cuộc thi giúp các bạn sinh viên được thỏa sức sáng tạo, bùng cháy với đam mê lập trình và thể hiện khả năng tư duy, kỹ năng lập trình để trở thành một ITer tài năng trong tương lai.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        '🎯 Nội dung thi bao gồm các kiến thức: Lập trình C, Pascal, Python … hoàn toàn phù hợp với sinh viên năm nhất. Tham gia thi, ngoài việc rèn luyện các kiến thức được học trên lớp, các bạn còn được nâng cao kỹ năng lập trình của bản thân, tiếp xúc với các bài tập, chủ đề mới mẻ và thú vị.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        '📍 Thông tin chi tiết về cuộc thi:',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '⏰ Thời gian đăng ký: đến hết ngày 15/11/2023.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '💥 Cuộc thi tổ chức vào 07h30, Thứ 3, ngày 21/11/2023.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '🏢 Địa điểm: Phòng E2 - 01.01 (Sảnh E2), Thu Duc Campus.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '🎉 Lễ trao giải: 13h00, Thứ 3, ngày 21/11/2023.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '❗ Địa điểm: Phòng E3 - 05.01, Thu Duc Campus.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '📌 Link đăng ký: ',
                              style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: 'https://bit.ly/CuocThi_UMTN_CNTT_2023!',
                              style: TextStyle(
                                  color: MyColors.blue,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '📌 Link Group Zalo: ',
                              style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: 'https://zalo.me/g/wnhfvu918',
                              style: TextStyle(
                                  color: MyColors.blue,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '🛠 Hình thức thi: Online trên máy tính cá nhân trong thời gian 180 phút.🛠 Hình thức thi: Online trên máy tính cá nhân trong thời gian 180 phút.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '🔑 Buổi hướng dẫn làm quen với hệ thống thi sẽ diễn ra vào lúc 18h30, Thứ 7 ngày 18/11/2023.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Cơ cấu giải thưởng:',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '🥇 01 giải nhất: Hiện kim + Giấy khen cấp trường.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '🥈 01 giải nhì: Hiện kim + Giấy khen cấp trường.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '🥉 01 giải ba: Hiện kim + Giấy khen cấp trường.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '🎀 05 giải khuyến khích: Hiện kim + Giấy khen cấp trường.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        '🎟 Tất cả thí sinh đăng ký và tham gia thi đều được trao giấy chứng nhận tham gia cuộc thi làm đẹp CV trong tương lai, là minh chứng học thuật cho sinh viên 5 tốt, Tập thể tiên tiến.',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 500),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
