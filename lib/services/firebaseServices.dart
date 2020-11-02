import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wizard/models/models.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String userCollection = 'users';

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
          .signInWithEmailAndPassword(email: email, password: pass);
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
}
