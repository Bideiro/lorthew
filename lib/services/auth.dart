import 'package:firebase_auth/firebase_auth.dart';
import 'package:lorthew/services/database.dart';

import '../models/cuser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user obj

  // cUser? _userFromFirebase(User user) {
  //   return cUser != null ? cUser(uid: user.uid) : null;
  // }

  cUser? _userFromFirebase(User user) {
    return cUser(uid: user.uid);
  }


  Stream<cUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  Future registerWithEmailAndPassword(String email, String pass,String fname, String lname) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);

      User? user = result.user!; //yung exclamation mark need wala ata idfk
      await DatabaseService(uid:user.uid).updateUserData(fname, lname);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? user = result.user!; //yung exclamation mark need wala ata idfk
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signMeOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
