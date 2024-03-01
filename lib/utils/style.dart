import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyColors {
  static const Color blue = Color.fromRGBO(33, 150, 243, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color green = Color.fromRGBO(76, 175, 80, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color grey = Color.fromRGBO(158, 158, 158, 1);
  static const Color lightGrey = Color.fromRGBO(224, 224, 224, 1);
  static const Color lightGreyAccent = Color.fromRGBO(199, 200, 204, 1);
  static const Color greyAccent = Color.fromRGBO(180, 180, 184, 1);
  static const Color red = Color.fromRGBO(244, 67, 54, 1);
  static const Color greenAccent = Color.fromRGBO(105, 240, 174, 1);
  static const Color darkRed = Color.fromRGBO(207, 7, 7, 1);
  static const Color lightGreen = Color.fromRGBO(81, 203, 85, 1);
  static const Color orange = Color.fromRGBO(255, 140, 0, 1);
  static const Color lightBlueAccent = Color.fromRGBO(64, 196, 255, 1);
  static const Color blueGrey = Color.fromRGBO(96, 125, 139, 1);
  static const Color lightBlue = Color.fromRGBO(3, 169, 244, 1);
  static const Color lightRed = Color.fromRGBO(255, 104, 104, 1);
}

class MySizes {
  static double size1SW = 0.00243.sw;
  static double size2SW = 0.004866.sw;
  static double size5SW = 0.0121.sw;
  static double size8SW = 0.019.sw;
  static double size10SW = 0.024.sw;
  static double size12SW = 0.03.sw;
  static double size14SW = 0.034.sw;
  static double size15SW = 0.035.sw;
  static double size16SW = 0.039.sw;
  static double size17SW = 0.041.sw;
  static double size18SW = 0.044.sw;
  static double size20SW = 0.048.sw;
  static double size22SW = 0.0535.sw;
  static double size24SW = 0.0584.sw;
  static double size25SW = 0.06.sw;
  static double size26SW = 0.06326.sw;
  static double size28SW = 0.068.sw;
  static double size30SW = 0.075.sw;
  static double size32SW = 0.078.sw;
  static double size35SW = 0.0851.sw;
  static double size40SW = 0.097.sw;
  static double size45SW = 0.1094.sw;
  static double size48SW = 0.11678.sw;
  static double size50SW = 0.1216.sw;
  static double size55SW = 0.1338.sw;
  static double size56SW = 0.1362.sw;
  static double size60SW = 0.146.sw;
  static double size65SW = 0.158.sw;
  static double size72SW = 0.175.sw;
  static double size80SW = 0.194.sw;
  static double size120SW = 0.292.sw;
  static double size85SW = 0.2.sw;
  static double size90SW = 0.2189.sw;
  static double size100SW = 0.2433.sw;
  static double size110SW = 0.2676.sw;
  static double size130SW = 0.3163.sw;
  static double size135SW = 0.328467.sw;
  static double size150SW = 0.3649.sw;
  static double size160SW = 0.389.sw;
  static double size165SW = 0.40146.sw;
  static double size175SW = 0.42579.sw;
  static double size190SW = 0.4622.sw;
  static double size200SW = 0.4866.sw;
  static double size210SW = 0.5109.sw;
  static double size245SW = 0.596.sw;
  static double size300SW = 0.73.sw;

  static double size10 = ScreenUtil().setSp(10.0);
  static double size12 = ScreenUtil().setSp(12.0);
  static double size14 = ScreenUtil().setSp(14.0);
  static double size15 = ScreenUtil().setSp(15.0);
  static double size16 = ScreenUtil().setSp(16.0);
  static double size17 = ScreenUtil().setSp(17.0);
  static double size18 = ScreenUtil().setSp(18.0);
  static double size20 = ScreenUtil().setSp(20.0);
  static double size22 = ScreenUtil().setSp(22.0);
  static double size24 = ScreenUtil().setSp(24.0);
  static double size25 = ScreenUtil().setSp(25.0);
  static double size28 = ScreenUtil().setSp(28.0);
  static double size30 = ScreenUtil().setSp(30.0);
  static double size32 = ScreenUtil().setSp(32.0);
  static double size40 = ScreenUtil().setSp(40.0);
  static double size80 = ScreenUtil().setSp(80.0);
  static double size90 = ScreenUtil().setSp(90.0);
  static double size100 = ScreenUtil().setSp(100.0);
}

class MyTextStyles {
  static TextStyle content12MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size12SW,
  );
  static TextStyle content15MediumDarkRedSW = TextStyle(
    color: MyColors.darkRed,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size15SW,
  );

  static TextStyle content18RegularBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Regular',
    fontSize: MySizes.size18SW,
  );
  static TextStyle content18MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size18SW,
  );
  static TextStyle content24MediumDarkRedkSW = TextStyle(
    color: MyColors.darkRed,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size24SW,
  );
  static TextStyle content30MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size30SW,
  );
  static TextStyle content25MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size25SW,
  );
  static TextStyle content28MediumBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size28SW,
  );
  static TextStyle content17RegularBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Regular',
    fontSize: MySizes.size17SW,
  );

  static TextStyle content16RegularBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Regular',
    fontSize: MySizes.size16SW,
  );

  static TextStyle content32BoldBlackWS = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size32SW,
  );
  static TextStyle content20MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content14MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size14SW,
  );
  static TextStyle content22MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size22SW,
  );
  static TextStyle content20MediumWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content90BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size90SW,
  );
  static TextStyle content100BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size100SW,
  );
  static TextStyle content80BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size80SW,
  );
  static TextStyle content15BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size15SW,
  );
  static TextStyle content14MediumGreySW = TextStyle(
    color: MyColors.grey,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size14SW,
  );
  static TextStyle content25BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size25SW,
  );
  static TextStyle content22BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size22SW,
  );

  static TextStyle content16BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size16SW,
  );
  static TextStyle content18BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size18SW,
  );
  static TextStyle content16BoldRedSW = TextStyle(
    color: MyColors.red,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size16SW,
  );
  static TextStyle content20BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content20BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content20MediumBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content22MediumBlueGreySW = TextStyle(
    color: MyColors.blueGrey,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size22SW,
  );
  static TextStyle content15MediumWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size15SW,
  );

  static TextStyle content14MediumBleSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size14SW,
  );

  //////////////////////////////////////////////
  //////////////////////////////////////////////
  //////////////////////////////////////////////
  //////////////////////////////////////////////
  //////////////////////////////////////////////
  //////////////////////////////////////////////

  static TextStyle content100MediumDarkRed = TextStyle(
    color: MyColors.darkRed,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size100,
  );
  static TextStyle content14MediumGrey = TextStyle(
    color: MyColors.grey,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size14,
  );
  static TextStyle content15BoldBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size15,
  );
  static TextStyle content16BoldBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size16,
  );
  static TextStyle content16BoldRed = TextStyle(
    color: MyColors.red,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size16,
  );

  static TextStyle content14MediumBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size14,
  );
  static TextStyle content12MediumBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size12,
  );
  static TextStyle content20MediumBlue = TextStyle(
    color: MyColors.blue,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size20,
  );
  static TextStyle content16RegularBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Regular',
    fontSize: MySizes.size16,
  );
  static TextStyle content22RegularBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Regular',
    fontSize: MySizes.size22,
  );
  static TextStyle content28MediumBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size28,
  );
  static TextStyle content17RegularBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Regular',
    fontSize: MySizes.size17,
  );
  static TextStyle content30MediumBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size30,
  );
  static TextStyle content18RegularBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Regular',
    fontSize: MySizes.size18,
  );
  static TextStyle content20MediumBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size20,
  );
  static TextStyle content18MediumBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size18,
  );
  static TextStyle content25MediumBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size25,
  );
  static TextStyle content22MediumBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size22,
  );
  static TextStyle content22BoldBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size22,
  );
  static TextStyle content20MediumWhite = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Medium',
    fontSize: MySizes.size20,
  );
  static TextStyle content20BoldBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size20,
  );
  static TextStyle content25BoldBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size25,
  );
  static TextStyle content32BoldBlack = TextStyle(
    color: MyColors.black,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size32,
  );
  static TextStyle content20BoldWhite = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size20,
  );
  static TextStyle content80BoldWhite = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size80,
  );
  static TextStyle content90BoldWhite = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size90,
  );
  static TextStyle content100BoldWhite = TextStyle(
    color: MyColors.white,
    fontFamily: 'Roboto-Bold',
    fontSize: MySizes.size100,
  );
}
