import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController email;
  TextEditingController name;
  TextEditingController pass;

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    pass.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();
    name = TextEditingController();
    super.onInit();
  }
}
