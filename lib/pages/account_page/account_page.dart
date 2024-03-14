import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/loading.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/account_list_tile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void _onTap() async {
    await loading();
    await dissmis();
    if (context.mounted) {
      Navigator.pushNamed(context, '/info_update');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(MySizes.size20SW, MySizes.size40SW,
            MySizes.size20SW, MySizes.size20SW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: MyColors.lightGrey,
                  radius: MySizes.size35SW,
                  child: Icon(
                    MyIcons.account,
                    size: MySizes.size35SW,
                    color: MyColors.white,
                  ),
                ),
                SizedBox(width: MySizes.size10SW),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: MySizes.size5SW),
                        child: Text(
                          'Vũ Thế Anh',
                          style: MyTextStyles.content25BoldBlackSW,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: _onTap,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              MySizes.size10SW,
                              MySizes.size5SW,
                              MySizes.size10SW,
                              MySizes.size5SW),
                          decoration: BoxDecoration(
                            color: MyColors.lightGrey,
                            borderRadius:
                                BorderRadius.circular(MySizes.size15SW),
                          ),
                          child: Text(
                            'Cập nhật thông tin cá nhân',
                            style: MyTextStyles.content15BoldBlackSW,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: MySizes.size40SW),
            Text(
              ' Tổng Quan',
              style: MyTextStyles.content22BoldBlackSW,
            ),
            SizedBox(height: MySizes.size20SW),
            const Card(
              child: Column(
                children: [
                  AccountListTile(
                    title: '2180607279',
                    iconData: MyIcons.frameUser,
                  ),
                  AccountListTile(
                    title: 'abcd@gmail.com',
                    iconData: MyIcons.mail,
                  ),
                  AccountListTile(
                    title: '21DTHE1',
                    iconData: MyIcons.frameChartBar,
                  ),
                  AccountListTile(
                    title: 'Công nghệ thông tin',
                    iconData: MyIcons.map,
                  ),
                ],
              ),
            ),
            SizedBox(height: MySizes.size20SW),
            const Card(
              child: Column(
                children: [
                  AccountListTile(
                    title: 'Đánh giá ứng dụng',
                    iconData: MyIcons.star,
                  ),
                  AccountListTile(
                    title: 'Phản hồi',
                    iconData: MyIcons.message2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
