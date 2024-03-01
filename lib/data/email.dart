import 'package:flutter/material.dart';

class Email extends ChangeNotifier {
  String _email = 'abcd@gmail.com';
  get getEmail => _email;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
}
