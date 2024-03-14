import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:hutech_check_in_app/data/email.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/update_button.dart';
import 'package:hutech_check_in_app/widgets/update_text_field.dart';
import 'package:provider/provider.dart';

class EmailUpdatePage extends StatefulWidget {
  const EmailUpdatePage({super.key});

  @override
  State<EmailUpdatePage> createState() => _EmailUpdatePageState();
}

class _EmailUpdatePageState extends State<EmailUpdatePage> {
  late TextEditingController _controller;
  late Timer _timer;
  late bool _checkInfo;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      checkInfo();
    });
  }

  bool checkInfo() {
    if (_controller.text.isEmail()) {
      setState(() {
        _checkInfo = true;
      });
      return _checkInfo;
    } else {
      setState(() {
        _checkInfo = false;
      });
      return _checkInfo;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Email',
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
                hintText: 'Nhập email mới',
                numberKeyboard: false,
                obscureText: false,
                toolTipText: 'Nhập đúng định dạng email',
              ),
              SizedBox(height: MySizes.size20SW),
              UpdateButton(
                sucess: checkInfo(),
                update: () {
                  checkInfo()
                      ? Provider.of<Email>(context, listen: false)
                          .setEmail(_controller.text)
                      : null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
