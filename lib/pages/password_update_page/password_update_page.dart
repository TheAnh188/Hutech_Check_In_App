import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:hutech_check_in_app/data/password.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/update_button.dart';
import 'package:hutech_check_in_app/widgets/update_text_field.dart';
import 'package:provider/provider.dart';

class PasswordUpdatePage extends StatefulWidget {
  const PasswordUpdatePage({super.key});

  @override
  State<PasswordUpdatePage> createState() => _PasswordUpdatePageState();
}

class _PasswordUpdatePageState extends State<PasswordUpdatePage> {
  late bool _checkInfo;
  late TextEditingController _passwordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _retypedPasswordController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _retypedPasswordController = TextEditingController();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      checkInfo();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _retypedPasswordController.dispose();
    _timer.cancel();
  }

  bool checkInfo() {
    if (_newPasswordController.text == _retypedPasswordController.text &&
        _passwordController.text ==
            Provider.of<Password>(context, listen: false).getPassword &&
        _passwordController.text.isPasswordEasy()) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mật khẩu',
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
                controller: _passwordController,
                hintText: 'Nhập mật khẩu hiện tại',
                numberKeyboard: false,
                obscureText: true,
              ),
              SizedBox(height: MySizes.size20SW),
              UpdateTextField(
                controller: _newPasswordController,
                hintText: 'Nhập mật khẩu mới',
                numberKeyboard: false,
                obscureText: true,
                toolTipText: 'Mật khẩu chứa ít nhất 8 kí tự',
              ),
              SizedBox(height: MySizes.size20SW),
              UpdateTextField(
                controller: _retypedPasswordController,
                hintText: 'Xác nhận mật khẩu',
                numberKeyboard: false,
                obscureText: true,
                toolTipText: 'Mật khẩu chứa ít nhất 8 kí tự',
              ),
              SizedBox(height: MySizes.size20SW),
              UpdateButton(
                sucess: checkInfo(),
                update: () {
                  checkInfo()
                      ? Provider.of<Password>(context, listen: false)
                          .setPassword(_newPasswordController.text)
                      : null;
                  print(Provider.of<Password>(context, listen: false)
                      .getPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class $ {}
