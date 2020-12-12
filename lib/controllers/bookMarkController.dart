import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/services/firebaseServices.dart';

class BookMarkController extends GetxController {
  static BookMarkController get to => Get.find();
  FirebaseService _firebaseService;
  RxList<Rx<PostModel>> posts = <Rx<PostModel>>[].obs;

  @override
  void onInit() {
    _firebaseService = FirebaseService.instance;
    refreshBooks();
    super.onInit();
  }

  Future<void> refreshBooks() async {
    final List<DocumentSnapshot> documentSnapshots =
        await _firebaseService.getBookmarks();
    final List<Rx<PostModel>> bookPosts = [];
    for (final item in documentSnapshots) {
      bookPosts.add(
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

    posts.assignAll(bookPosts);
  }
}
