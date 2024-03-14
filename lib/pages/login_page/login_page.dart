import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/loading.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late bool _isChecked;
  late bool _hidePassword;

  @override
  void initState() {
    super.initState();
    _isChecked = false;
    _hidePassword = true;
  }

  void _login() async {
    FocusScope.of(context).requestFocus(FocusNode());
    await loading();
    await dissmis();
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool keyBoardOpened = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          !keyBoardOpened
              ? Container(
                  margin: EdgeInsets.only(top: MySizes.size40SW),
                  height: MySizes.size300SW,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Images.backgroundlogin),
                        fit: BoxFit.cover),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: MySizes.size10SW),
                  child: SizedBox(
                      height: MySizes.size160SW,
                      child: Image.asset(Images.logo)),
                ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySizes.size30SW),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MySizes.size55SW,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: MySizes.size10SW),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.black),
                        borderRadius: BorderRadius.circular(MySizes.size10SW),
                      ),
                      child: TextField(
                        style: MyTextStyles.content18RegularBlackSW,
                        decoration: const InputDecoration(
                          hintText: "Mã số sinh viên hoặc Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: MySizes.size10SW),
                    Container(
                      height: MySizes.size55SW,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: MySizes.size10SW),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.black),
                        borderRadius: BorderRadius.circular(MySizes.size10SW),
                      ),
                      child: TextField(
                        style: MyTextStyles.content18RegularBlackSW,
                        obscureText: _hidePassword,
                        decoration: InputDecoration(
                          suffixIconConstraints: BoxConstraints.expand(
                            width: MySizes.size48SW,
                            height: 48,
                          ),
                          suffixIcon: IconButton(
                            style: const ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              _hidePassword
                                  ? setState(() {
                                      _hidePassword = false;
                                    })
                                  : setState(() {
                                      _hidePassword = true;
                                    });
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              size: MySizes.size25SW,
                              color: !_hidePassword
                                  ? MyColors.blue
                                  : MyColors.grey,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: "Mật khẩu",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MySizes.size5SW),
                Container(
                  height: MySizes.size40SW,
                  alignment: Alignment.center,
                  child: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: MySizes.size1SW,
                          child: Checkbox(
                            splashRadius: 0,
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            activeColor: MyColors.green,
                            checkColor: MyColors.white,
                            side: const BorderSide(
                                color: MyColors.grey, width: 1),
                          ),
                        ),
                        Text(
                          'Duy trì đăng nhập',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MySizes.size18SW,
                              color:
                                  _isChecked ? MyColors.green : MyColors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MySizes.size15SW),
                AnimatedButton(
                  height: MySizes.size50SW,
                  isFixedHeight: false,
                  buttonTextStyle: MyTextStyles.content20BoldWhiteSW,
                  borderRadius: BorderRadius.circular(MySizes.size12SW),
                  text: 'Đăng nhập',
                  color: MyColors.blue,
                  pressEvent: _login,
                ),
                SizedBox(height: MySizes.size1SW),
                TextButton(
                  style: const ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Quên mật khẩu",
                    style: MyTextStyles.content20MediumBlueSW,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
