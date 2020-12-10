import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/services/firebaseServices.dart';

class BookMarkController extends GetxController {
  static BookMarkController get to => Get.find();
  FirebaseService _firebaseService;
  RxList<Rx<PostModel>> bookPosts = <Rx<PostModel>>[].obs;

  @override
  void onInit() {
    _firebaseService = FirebaseService.instance;
    refreshBooks();
    super.onInit();
  }

  Future<void> refreshBooks() async {
    final List<DocumentSnapshot> documentSnapshots =
        await FirebaseService.instance.getBookmarks();
    final List<Rx<PostModel>> posts = [];
    for (final item in documentSnapshots) {
      posts.add(
        PostModel.fromJson(
          item.data(),
        )
            .copyWith(
              postUid: item.id,
              bookmarked:
                  _firebaseService.currentUser.bookmarks.contains(item.id),
            )
            .obs,
      );
    }

    bookPosts.assignAll(posts);
  }
}
