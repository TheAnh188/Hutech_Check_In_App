import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:intl/intl.dart';

class HistoryListTile extends StatelessWidget {
  const HistoryListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(
        'Thời gian điểm danh',
        style: MyTextStyles.content18RegularBlack,
      ),
      subtitle: Text(DateFormat('kk:mm yyyy-MM-dd').format(DateTime.now())),
      trailing:
          Icon(Icons.check_circle, color: MyColors.green, size: MySizes.size24),
    );
  }
}
