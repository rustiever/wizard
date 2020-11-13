import 'package:get/get.dart';
import 'package:markdown_widget/markdown_toc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/services/firebaseServices.dart';

class PostController extends GetxController {
  FirebaseService _firebaseService;
  final TocController tocController = TocController();
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
    final snapshots = await _firebaseService.getTrendingPosts();
    for (final item in snapshots) {
      trendingPosts.add(
        PostModel.fromJson(item.data()),
      );
    }
    print(trendingPosts.length);
    trendingPosts.shuffle();
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
