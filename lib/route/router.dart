import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/check_in_home_page/check_in_home_page.dart';
import 'package:hutech_check_in_app/pages/detail_asssignment_page/detail_asssignment_page.dart';
import 'package:hutech_check_in_app/pages/detail_contest_home_page/detail_contest_home_page.dart';
import 'package:hutech_check_in_app/pages/detail_contest_page/detail_contest_page.dart';
import 'package:hutech_check_in_app/pages/detail_group_page/detail_group_page.dart';
import 'package:hutech_check_in_app/pages/email_update_page/email_update_page.dart';
import 'package:hutech_check_in_app/pages/notifications_page/notifications_page.dart';
import 'package:hutech_check_in_app/pages/password_update_page/password_update_page.dart';
import 'package:hutech_check_in_app/pages/phone_number_update_page/phone_number_update_page.dart';
import 'package:hutech_check_in_app/pages/qr_scanner_page/qr_scanner_page.dart';
import 'package:hutech_check_in_app/pages/ranking_page/ranking_page.dart';
import 'package:hutech_check_in_app/pages/info_update_page/info_update_page.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/group_introduction.dart';
import 'package:page_transition/page_transition.dart';

class MyRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/detail_group':
        {
          return PageTransition(
            child: const DetailGroupPage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/group_introduction':
        {
          return PageTransition(
            child: const GroupIntroduction(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/main':
        {
          return PageTransition(
            child: const CheckInApp(),
            type: PageTransitionType.fade,
            settings: settings,
          );
        }
      case '/check_in_home':
        {
          return PageTransition(
            child: const CheckInHomePage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/detail_contest_home':
        {
          return PageTransition(
            child: const DetailContestHomePage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/detail_contest':
        {
          return PageTransition(
            child: const DetailContestPage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/notification':
        {
          return PageTransition(
            child: const NotificationsPage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/detail_assignment':
        {
          return PageTransition(
            child: const DetailAssignmentPage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/ranking':
        {
          return PageTransition(
            child: const RankingPage(),
            type: PageTransitionType.bottomToTop,
            settings: settings,
          );
        }
      case '/qr':
        {
          return PageTransition(
            child: const QRScannerPage(),
            type: PageTransitionType.fade,
            settings: settings,
          );
        }
      case '/info_update':
        {
          return PageTransition(
            child: const InfoUpdatePage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/phone_number_update':
        {
          return PageTransition(
            child: const PhoneNumberUpdatePage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/email_update':
        {
          return PageTransition(
            child: const EmailUpdatePage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      case '/password_update':
        {
          return PageTransition(
            child: const PasswordUpdatePage(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        }
      default:
        {
          return PageTransition(
              child: Scaffold(
                body: Center(
                  child: Text('No routes match',
                      style: MyTextStyles.content20MediumBlack),
                ),
              ),
              type: PageTransitionType.fade,
              settings: settings);
        }
    }
  }
}
