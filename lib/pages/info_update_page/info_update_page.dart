import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/loading.dart';
import 'package:hutech_check_in_app/data/email.dart';
import 'package:hutech_check_in_app/data/phone_number.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/info_update_card.dart';
import 'package:provider/provider.dart';

class InfoUpdatePage extends StatefulWidget {
  const InfoUpdatePage({super.key});

  @override
  State<InfoUpdatePage> createState() => _InfoUpdatePageState();
}

class _InfoUpdatePageState extends State<InfoUpdatePage> {
  void _onTap() async {
    await loading();
    await dissmis();
    if (context.mounted) {
      Navigator.pushNamed(context, '/password_update');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: MySizes.size85SW,
          leadingWidth: MySizes.size65SW,
          leading: const BackArrowButton()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MySizes.size20SW),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: MySizes.size5SW),
                child: RichText(
                  text: TextSpan(
                    style: MyTextStyles.content16BoldBlackSW,
                    children: [
                      const TextSpan(text: 'Liên hệ qua Email '),
                      TextSpan(
                          text: 'bp.khuyen@hutech.edu.vn',
                          style: MyTextStyles.content16BoldRedSW),
                      const TextSpan(
                          text:
                              ' kèm thông tin cụ thể cần chỉnh sửa nếu có sai sót'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MySizes.size20SW),
              const InforUpdateCard(
                title: 'MSSV',
                detail: '2180607279',
                enable: false,
                route: '',
              ),
              const InforUpdateCard(
                title: 'Họ và tên',
                detail: 'Vũ Thế Anh',
                enable: false,
                route: '',
              ),
              const InforUpdateCard(
                title: 'Lớp',
                detail: '21DTHE1',
                enable: false,
                route: '',
              ),
              InforUpdateCard(
                title: 'Số điện thoại',
                detail: Provider.of<PhoneNumber>(context).getPhoneNumber,
                enable: true,
                route: '/phone_number_update',
              ),
              InforUpdateCard(
                title: 'Email',
                detail: Provider.of<Email>(context).getEmail,
                enable: true,
                route: '/email_update',
              ),
              SizedBox(height: MySizes.size20SW),
              GestureDetector(
                onTap: _onTap,
                child: Container(
                  height: MySizes.size45SW,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MyColors.blue,
                    borderRadius: BorderRadius.circular(MySizes.size25SW),
                  ),
                  child: Center(
                    child: Text(
                      'Thay đổi mật khẩu',
                      style: MyTextStyles.content20MediumWhiteSW,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
