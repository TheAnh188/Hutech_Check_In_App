import 'package:flutter/material.dart';

class Password extends ChangeNotifier {
  String _password = '123';
  get getPassword => _password;

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }
}
