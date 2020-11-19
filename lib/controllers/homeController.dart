import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/services/firebaseServices.dart';

class HomeController extends GetxController {
  FirebaseService _firebaseService;
  RxList<PostModel> posts = <PostModel>[].obs;
  RxList<PostModel> totalPosts = <PostModel>[].obs;

// @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  @override
  void onInit() {
    _firebaseService = FirebaseService.instance;
    _getPosts();
    super.onInit();
  }

  Future<void> shuffle() async {
    posts.clear();
    await Future.delayed(const Duration(milliseconds: 100));
    posts.assignAll(
      totalPosts.sublist(0, 15),
    );
  }

  Future<void> _getPosts() async {
    final List<QueryDocumentSnapshot> snapshots =
        await _firebaseService.getTrendingPosts();
    for (final item in snapshots) {
      totalPosts.add(
        PostModel.fromJson(item.data()).copyWith(postUid: item.id),
      );
    }
    print(totalPosts.length);
    totalPosts.shuffle();
    posts.assignAll(
      totalPosts.sublist(0, 15),
    );
  }
}
