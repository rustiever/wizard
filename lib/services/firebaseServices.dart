import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wizard/models/models.dart';

import '../constants.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User get currentUser => auth.currentUser;
  Stream<User> get authChange => auth.authStateChanges();

  Future<void> createUserWithEmailAndPassword(
      String email, String pass, String name) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: pass);

      await addUserToDB(
        UserModel(
          name: userCredential.user.displayName ?? name,
          uid: userCredential.user.uid,
          email: userCredential.user.email,
          posts: [],
        ),
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
      await FirebaseAuth.instance
          // .signInWithEmailAndPassword(email: email, password: pass);
          .signInWithEmailAndPassword(
              email: 'sdf@gm.in', password: 'Sharan@57');
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

  Future<void> uploadFile(PostModel postModel) async {
    await firestore.collection(postCollection).add(postModel.toJson());
  }

  Future<List<PostModel>> getTrendingPosts() async {
    final List<QueryDocumentSnapshot> snapshots =
        (await firestore.collection(postCollection).get()).docs;
    print('trend here ${snapshots.first.data().entries}');
    List<PostModel> posts;
    for (final item in snapshots) {
      posts.add(
        PostModel.fromJson(
          item.data(),
        ),
      );
    }
    return posts;
  }
}
