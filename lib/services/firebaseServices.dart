import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wizard/models/models.dart';

import '../constants.dart';

class FirebaseService {
  FirebaseService._internal();
  static final FirebaseService instance = FirebaseService._internal();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserModel userModel;
  UserModel get currentUser => userModel;
  set currentUser(UserModel userModel) => this.userModel = userModel;
  Stream<User> get authChange => auth.authStateChanges();

  Future<void> createUserWithEmailAndPassword(
      String email, String pass, String name) async {
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
              // email: email, password: pass
              email: 'sdf@gm.in',
              password: 'Sharan@57');

      await addUserToDB(
        UserModel(
          name: userCredential.user.displayName ?? name,
          uid: userCredential.user.uid,
          email: userCredential.user.email,
          bookmarks: <String>[],
        ),
      );
      currentUser = UserModel.fromJson(
        (await firestore
                .collection(userCollection)
                .doc(userCredential.user.uid)
                .get())
            .data(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String pass) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          // .signInWithEmailAndPassword(email: email, password: pass);
          .signInWithEmailAndPassword(
              email: 'sdf@gm.in', password: 'Sharan@57');

      currentUser = UserModel.fromJson(
        (await firestore
                .collection(userCollection)
                .doc(userCredential.user.uid)
                .get())
            .data(),
      );
      print(userModel.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> addUserToDB(UserModel userModel) async =>
      firestore.collection(userCollection).doc(userModel.uid).set(
            userModel.toJson(),
          );

  Future<void> bookmarking(UserModel userModel, String postUid,
      {bool flag = true}) async {
    if (flag) {
      await firestore.collection(userCollection).doc(userModel.uid).update({
        "bookmarks": FieldValue.arrayUnion([postUid])
      });
    } else {
      await firestore.collection(userCollection).doc(userModel.uid).update({
        "bookmarks": FieldValue.arrayRemove([postUid])
      });
    }
  }

  Future<UserModel> getBookmarks(String uid) async {
    return UserModel.fromJson(
      (await firestore.collection(userCollection).doc(uid).get()).data(),
    );
  }

  Future<void> uploadStory(PostModel postModel) async =>
      firestore.collection(postCollection).add(postModel.toJson());

  Future<List<QueryDocumentSnapshot>> getTrendingPosts() async {
    final List<QueryDocumentSnapshot> snapshots =
        (await firestore.collection(postCollection).get()).docs;
    return snapshots;
  }
}
