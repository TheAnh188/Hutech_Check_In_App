import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loading() async {
  await EasyLoading.show(
    status: 'Đang tải',
  );
}

Future<void> dissmis() async {
  await EasyLoading.dismiss();
}
