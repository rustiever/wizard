import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wizard/models/models.dart';

class PostController extends GetxController {
  static PostController get to => Get.find();
  // FirebaseService _firebaseService;

  RxList<PostModel> trendingPosts = <PostModel>[].obs;

// @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  // @override
  // void onInit() {
  //   // _firebaseService = FirebaseService.instance;
  //   super.onInit();
  // }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
