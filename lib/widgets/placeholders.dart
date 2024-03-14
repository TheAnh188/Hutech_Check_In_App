import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class BannerPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  const BannerPlaceholder(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(
        left: MySizes.size20SW,
        right: MySizes.size20SW,
        bottom: MySizes.size8SW,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MySizes.size20SW),
        color: MyColors.white,
      ),
    );
  }
}

class ContentPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  const ContentPlaceholder(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: MySizes.size20SW),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(MySizes.size8SW)),
    );
  }
}

class CategoryPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  const CategoryPlaceholder(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MySizes.size5SW),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(MySizes.size80SW)),
    );
  }
}
