import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:wizard/models/postModel.dart';
import 'package:wizard/services/firebaseServices.dart';
import 'package:intl/intl.dart';

class NewStoryController extends GetxController {
  static NewStoryController get to => Get.find();
  DropzoneViewController controller;
  RxString fileName = ''.obs;
  RxList fileData = [].obs;
  PostModel post;
  FirebaseService _firebaseService;

  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  @override
  void onInit() {
    _firebaseService = FirebaseService.instance;
    ever(
      fileData,
      (val) {
        print(fileName.value);
        // final data = utf8.decode(val as Uint8List);
        post = PostModel(
            finishTime: Random().nextInt(11) + 1,
            date: DateFormat.MMMd().format(DateTime.now()),
            uid: _firebaseService.currentUser.uid,
            data: val as Uint8List,
            claps: 0,
            authorName: _firebaseService.currentUser.name,
            authorImage:
                'https://images.unsplash.com/photo-1602747686932-46bc9dbe6098?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=842&q=80',
            title: fileName.value);
      },
    );
    super.onInit();
  }

  void upload() {
    if (!post.isNull) {
      _firebaseService.uploadFile(post);
    }
  }
}
