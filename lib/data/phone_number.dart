import 'package:flutter/material.dart';

class PhoneNumber extends ChangeNotifier {
  String _phoneNumber = '0909234123';
  get getPhoneNumber => _phoneNumber;

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }
}
