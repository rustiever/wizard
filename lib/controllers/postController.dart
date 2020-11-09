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
    final snapshots = await _firebaseService.getTrendingPosts();
    for (final item in snapshots) {
      trendingPosts.add(
        PostModel.fromJson(item.data()),
      );
    }
    print(trendingPosts.length);
  }
}
