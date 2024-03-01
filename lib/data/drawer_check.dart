import 'package:flutter/material.dart';

class DrawerCheck extends ChangeNotifier {
  bool _isChecked = true;
  get getIsChecked => _isChecked;

  set setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}
