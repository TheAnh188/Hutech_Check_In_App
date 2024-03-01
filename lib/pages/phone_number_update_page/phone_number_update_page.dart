import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/phone_number.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/update_button.dart';
import 'package:hutech_check_in_app/widgets/update_text_field.dart';
import 'package:provider/provider.dart';

class PhoneNumberUpdatePage extends StatefulWidget {
  const PhoneNumberUpdatePage({super.key});

  @override
  State<PhoneNumberUpdatePage> createState() => _PhoneNumberUpdatePageState();
}

class _PhoneNumberUpdatePageState extends State<PhoneNumberUpdatePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Số điện thoại',
          style: MyTextStyles.content22BoldBlackSW,
        ),
        toolbarHeight: MySizes.size85SW,
        leadingWidth: MySizes.size65SW,
        leading: const BackArrowButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MySizes.size25SW, vertical: MySizes.size10SW),
          child: Column(
            children: [
              UpdateTextField(
                controller: _controller,
                hintText: 'Nhập số điện thoại mới',
                numberKeyboard: true,
              ),
              SizedBox(height: MySizes.size20SW),
              UpdateButton(
                update: () {
                  Provider.of<PhoneNumber>(context, listen: false)
                      .setPhoneNumber(_controller.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
