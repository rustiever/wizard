import 'package:get/get.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/services/firebaseServices.dart';

class PostController extends GetxController {
  FirebaseService _firebaseService;
  RxList<PostModel> trendingPosts = <PostModel>[].obs;
  RxList<PostModel> recomondsPosts = <PostModel>[].obs;
  RxList<PostModel> recentPosts = <PostModel>[].obs;
// @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  @override
  void onInit() {
    _firebaseService = FirebaseService.instance;
    _getTrendingPosts();
    _getRecomondsPosts();
    _getRecentPosts();
    super.onInit();
  }

  Future<void> _getTrendingPosts() async {
    final snapshots = await _firebaseService.getTrendingPosts();
    for (final item in snapshots) {
      trendingPosts.add(
        PostModel.fromJson(item.data()),
      );
    }
    print(trendingPosts.length);
    trendingPosts.shuffle();
  }

  Future<void> _getRecomondsPosts() async {
    final snapshots = await _firebaseService.getRecomondsPosts();
    for (final item in snapshots) {
      recomondsPosts.add(
        PostModel.fromJson(item.data()),
      );
    }
    print(recomondsPosts.length);
    recomondsPosts.shuffle();
  }

  Future<void> _getRecentPosts() async {
    final snapshots = await _firebaseService.getRecentsPosts();
    for (final item in snapshots) {
      recentPosts.add(
        PostModel.fromJson(item.data()),
      );
    }
    print(recentPosts.length);
    recentPosts.shuffle();
  }
}
