import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/data/subject.dart';

class Notificationn extends ChangeNotifier {
  bool _isChecked = false;
  bool _isSeen = false;
  String _content = '';
  Subject _subject = Subject();

  get getIsChecked => _isChecked;
  get getIsSeen => _isSeen;
  get getContent => _content;
  get getSubject => _subject;

  set setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  set setIsSeen(bool value) {
    _isSeen = value;
    notifyListeners();
  }

  set setContent(String value) {
    _content = value;
    notifyListeners();
  }

  set setSubject(Subject value) {
    _subject = value;
    notifyListeners();
  }
}

class NotificationList extends ChangeNotifier {
  List<Notificationn> _list = [];

  get getList => _list;

  set setList(value) {
    _list = value;
    notifyListeners();
  }

  final List<String> contents = [
    'Các bạn nhớ hoàn thành bài tập đúng hạn nhé!!',
    'Tuần sau các bạn sẽ một bài kiểm tra cuối kỳ!! Cả lớp nhớ đến lớp đúng giờ!!',
    'Chào các bạn!! Các bạn kiểm tra lại điểm của mình nếu có thắc mắc thì liên hệ mình trước ngày 5/4',
    'Tuần sau mình sẽ học bù vào chiều T7 phòng E1.10.1',
  ];

  List<Notificationn> generate(List<Subject> list) {
    if (_list.isEmpty) {
      for (int i = 0; i < list.length; i++) {
        Notificationn notificationCheck = Notificationn();
        notificationCheck.setContent = contents[i];
        notificationCheck.setSubject = list[i];
        _list.add(notificationCheck);
      }
    }
    return _list;
  }
}
