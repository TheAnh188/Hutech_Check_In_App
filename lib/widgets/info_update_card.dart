import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/loading.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class InforUpdateCard extends StatelessWidget {
  final String title;
  final String detail;
  final bool enable;
  final String route;
  const InforUpdateCard(
      {super.key,
      required this.title,
      required this.detail,
      required this.enable,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable
          ? () async {
              await loading();
              await dissmis();
              if (context.mounted) {
                Navigator.pushNamed(context, route);
              }
            }
          : null,
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: MySizes.size20SW, vertical: MySizes.size12SW),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: MyColors.black,
                        fontFamily: 'Roboto-Medium',
                        fontSize: MySizes.size16SW,
                        wordSpacing: -2,
                      ),
                    ),
                    Text(
                      detail,
                      style: TextStyle(
                        color: MyColors.blue,
                        fontFamily: 'Roboto-Medium',
                        fontSize: MySizes.size16SW,
                        wordSpacing: -1,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                enable ? MyIcons.forwardArrow : null,
                size: MySizes.size24SW,
              )
            ],
          ),
        ),
      ),
    );
  }
}
