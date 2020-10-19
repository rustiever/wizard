import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController email;
  TextEditingController pass;

  @override
  void onClose() {
    email.dispose();
    pass.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }
}
