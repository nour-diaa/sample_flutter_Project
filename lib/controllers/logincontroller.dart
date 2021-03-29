import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_flutter_project/services/api.dart';

class LoginController extends GetxController {
  TextEditingController email = new TextEditingController();
  TextEditingController passwd = new TextEditingController();
  final box = GetStorage();

  RxBool errorOccured = false.obs;
  RxBool toggleObscureTxt = true.obs;
  resetBools() {
    errorOccured.value = false;
  }

  Future<bool> login() async {
    Map resMap = await Api.login(this.email.text, this.passwd.text);
    if (resMap != null) {
      final box = GetStorage();
      box.write('token', resMap['token']);
      return true;
    }
    return false;
  }
}
