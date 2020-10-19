import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  User get currentUser => auth.currentUser;
  Stream<User> get authChange => auth.authStateChanges();

  Future<void> createUserWithEmailAndPassword(String email, String pass) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: pass);
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
}
