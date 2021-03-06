import 'dart:math';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:wizard/constants.dart';
import 'package:wizard/models/postModel.dart';
import 'package:wizard/services/firebaseServices.dart';
import 'package:intl/intl.dart';

class NewStoryController extends GetxController {
  static NewStoryController get to => Get.find();
  final preview = false.obs;
  final previewMe = false.obs;
  DropzoneViewController controller;
  RxString fileName = ''.obs;
  RxString title = ''.obs;
  RxList<int> fileData = <int>[].obs;
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
        print(title.value);
        print(fileName.value);
      },
    );
    super.onInit();
  }

  void upload() {
    print(title.value);
    print(fileName.value);

    if (fileName.value.isNotEmpty) {
      final number = Random().nextInt(namimage.length);
      final name = namimage.keys.elementAt(number);
      final image = namimage.values.elementAt(number);
      post = PostModel(
        finishTime: Random().nextInt(11) + 1,
        date: DateFormat.MMMd().format(DateTime.now()),
        ownerUid: _firebaseService.currentUser.uid,
        data: fileData,
        claps: 0,
        authorName: name,
        authorImage: image,
        fileName: fileName.value,
        title: title.value,
      );
      _firebaseService.uploadStory(post);

      preview.value = previewMe.value = false;
      fileName.value = '';
    }
  }
}
