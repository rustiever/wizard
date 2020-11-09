import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/services/firebaseServices.dart';

class PostController extends GetxController {
  FirebaseService _firebaseService;
  RxList<PostModel> trendingPosts = <PostModel>[].obs;
// @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  @override
  void onInit() {
    _firebaseService = FirebaseService();
    getTrendingPosts();
    super.onInit();
  }

  Future<void> getTrendingPosts() async {
    trendingPosts.value = await _firebaseService.getTrendingPosts();
    print('trend heresdf');
    final PostModel postModel = trendingPosts.first;
    print(
      utf8.decode(postModel.data as Uint8List),
    );
  }
}
