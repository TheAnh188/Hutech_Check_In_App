import 'package:flutter/material.dart';

class BottomBarController extends ChangeNotifier {
  PageController _pageController = PageController();

  get getPageController => _pageController;

  set setPageController(value) {
    _pageController = value;
    notifyListeners();
  }
}
