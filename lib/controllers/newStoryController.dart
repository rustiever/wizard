import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:wizard/models/postModel.dart';
import 'package:wizard/services/firebaseServices.dart';

class NewStoryController extends GetxController {
  static NewStoryController get to => Get.find();
  DropzoneViewController controller;
  RxString fileName = ''.obs;
  RxList fileData = [].obs;
  PostModel post;

  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  @override
  void onInit() {
    ever(fileData, (val) {
      print(fileName.value);
      final data = utf8.decode(val as Uint8List);
      post = PostModel(
          uid: FirebaseService().currentUser.uid,
          data: data,
          claps: 0,
          name: fileName.value);
    });
    super.onInit();
  }

  void upload() {
    if (!post.isNull) {
      FirebaseService().uploadFile(post);
    }
  }
}
