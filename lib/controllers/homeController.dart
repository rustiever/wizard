import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/services/firebaseServices.dart';

class HomeController extends GetxController {
  FirebaseService _firebaseService;
  RxList<PostModel> trendingPosts = <PostModel>[].obs;

// @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  @override
  void onInit() {
    _firebaseService = FirebaseService.instance;
    _getTrendingPosts();
    super.onInit();
  }

  Future<void> _getTrendingPosts() async {
    final List<QueryDocumentSnapshot> snapshots =
        await _firebaseService.getTrendingPosts();
    for (final item in snapshots) {
      trendingPosts.add(
        PostModel.fromJson(item.data()).copyWith(postUid: item.id),
      );
    }
    print(trendingPosts.length);
    trendingPosts.shuffle();
  }
}
