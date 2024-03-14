import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/placeholders.dart';
import 'package:shimmer/shimmer.dart';

class LoadingAssignmentPage extends StatelessWidget {
  const LoadingAssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.lightGrey,
      highlightColor: MyColors.lightGrey.withOpacity(.2),
      enabled: true,
      direction: ShimmerDirection.ttb,
      child: Column(
        children: [
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size135SW,
          ),
          SizedBox(height: MySizes.size30SW),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          )
        ],
      ),
    );
  }
}
