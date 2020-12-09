import 'package:get/get.dart';
import 'package:wizard/models/userModel.dart';
import 'package:wizard/services/firebaseServices.dart';

class BookMarkController extends GetxController {
  static BookMarkController get to => Get.find();
  Rx<UserModel> user = Rx<UserModel>();

  @override
  void onInit() {
    refreshBooks();

    super.onInit();
  }

  Future<void> refreshBooks() async {
    user.value = await FirebaseService.instance
        .getBookmarks(FirebaseService.instance.currentUser.uid);
  }
}
