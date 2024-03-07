class Assignment {
  String _title = '';
  String _correctQuantity = '';

  get getTitle => _title;
  get getCorrectQuantity => _correctQuantity;

  set setTitle(value) {
    _title = value;
  }

  set setCorrectQuantity(value) {
    _correctQuantity = value;
  }
}

class AssignmentList {
  List<Assignment> _list = [];

  get getList => _list;

  set setList(value) {
    _list = value;
  }

  final List<String> _assignmentTitles = [
    'CHẤM ĐIỂM TRẮC NGHIỆM',
    'HUTECH IT OFFICE TOUR',
    'THUÊ XE',
    'DÃY CON MA THUẬT',
    'TAM GIÁC SỐ',
    'HUTECH IT CODER',
    'CHẤM ĐIỂM TRẮC NGHIỆM',
    'CHẤM ĐIỂM TRẮC NGHIỆM',
    'CHẤM ĐIỂM TRẮC NGHIỆM',
  ];

  final List<String> _correctQuantities = [
    '46/160',
    '7/409',
    '4/81',
    '5/185',
    '10/42',
    '0/17',
    '14/120',
    '14/120',
    '14/120',
  ];

  List<Assignment> generate() {
    if (_list.isEmpty) {
      for (int i = 0; i < _assignmentTitles.length; i++) {
        Assignment assignment = Assignment();
        assignment.setTitle = _assignmentTitles[i];
        assignment.setCorrectQuantity = _correctQuantities[i];
        _list.add(assignment);
      }
    }
    return _list;
  }
}
