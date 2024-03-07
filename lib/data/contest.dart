class Contest {
  String _title = '';
  bool _isEnrolled = false;
  int _studentQuantity = 0;

  get getTitle => _title;
  get getIsEnrolled => _isEnrolled;
  get getStudentQuantity => _studentQuantity;

  set setTitle(value) {
    _title = value;
  }

  set setIsEnrolled(value) {
    _isEnrolled = value;
  }

  set setStudentQuantity(value) {
    _studentQuantity = value;
  }
}

class ContestList {
  List<Contest> _list = [];

  get getList => _list;

  set setList(value) {
    _list = value;
  }

  final List<String> _contests = [
    'KỲ THI LẬP TRÌNH CÁ NHÂN 12/2023 - LÝ THUYẾT ĐỒ THỊ',
    'VÒNG CHUNG KẾT CUỘC THI ƯƠM MẦM TÀI NĂNG CNTT 2023',
    'VÒNG SƠ LOẠI CUỘC THI ƯƠM MẦM TÀI NĂNG CNTT 2023',
    'KỲ THI LẬP TRÌNH CÁ NHÂN THÁNG 10/2023',
    '[THI THỬ] HỌC PHẦN KỸ THUẬT LẬP TRÌNH',
    'KỲ THI LẬP TRÌNH CÁ NHÂN THÁNG 06/2023',
  ];

  List<Contest> initContests() {
    if (_list.isEmpty) {
      for (int i = 0; i < _contests.length; i++) {
        Contest contest = Contest();
        contest.setTitle = _contests[i];
        if (i % 2 == 0) {
          contest.setIsEnrolled = true;
        }
        contest.setStudentQuantity = i + 100;
        _list.add(contest);
      }
    }
    return _list;
  }
}
