import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/widgets/group_widget.dart';

class Subject extends ChangeNotifier {
  String _title = '';
  String _subTitle = '';
  String _lecturer = '';
  final GlobalKey<GroupWidgetState> _key = GlobalKey();

  get getTitle => _title;
  get getSubTitle => _subTitle;
  get getLecturer => _lecturer;
  get getKey => _key;

  set setTitle(value) {
    _title = value;
    notifyListeners();
  }

  set setSubTitle(value) {
    _subTitle = value;
    notifyListeners();
  }

  set setLecturer(value) {
    _lecturer = value;
    notifyListeners();
  }
}

class SubjectList extends ChangeNotifier {
  List<Subject> _enrolledList = [];
  List<Subject> _archivedList = [];

  get getEnrolledList => _enrolledList;

  get getArchivedList => _archivedList;

  set setEnrolledList(value) {
    _enrolledList = value;
    notifyListeners();
  }

  set setArchivedList(value) {
    _archivedList = value;
    notifyListeners();
  }

  final List<String> _enrolledSubjects = [
    'Thực hành lập trình trên môi trường Windows',
    'Thực hành an toàn máy chủ',
    'Thực hành lý thuyết đồ thị',
    'Thực hành lập trình di động',
  ];

  final List<String> _archivedSubjects = [
    'Thực hành lập trình hướng đối tượng',
    'Thực hành lập trình web',
    'Thực hành cấu trúc dữ liệu',
    'Thực hành phân tích thiết kế hệ thống',
  ];

  List<Subject> initEnrolledSubjects() {
    if (_enrolledList.isEmpty) {
      for (int i = 0; i < _enrolledSubjects.length; i++) {
        Subject subject = Subject();
        subject.setTitle = _enrolledSubjects[i];
        subject.setSubTitle =
            'Sáng sT5 - Nhóm 27 - Tổ TH 01 - Phòng E1-10.06/2';
        subject.setLecturer = 'Bùi Phú Khuyên';
        _enrolledList.add(subject);
      }
    }
    return _enrolledList;
  }

  List<Subject> initArchivedSubjects() {
    if (_archivedList.isEmpty) {
      for (int i = 0; i < _archivedSubjects.length; i++) {
        Subject subject = Subject();
        subject.setTitle = _archivedSubjects[i];
        subject.setSubTitle =
            'Sáng sT5 - Nhóm 27 - Tổ TH 01 - Phòng E1-10.06/2';
        subject.setLecturer = 'Bùi Phú Khuyên';
        _archivedList.add(subject);
      }
    }
    return _archivedList;
  }
}
