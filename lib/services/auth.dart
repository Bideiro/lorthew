import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //user obj

  User _userFromFirebase(FirebaseUser user){
    return user != null ? User(uid: user.uid) :null;
  }

Stream<User> get user{
return _auth.onAuthStateChanged.map(_userFromFirebase);

}
  Future signIn() async {
    try {
      AuthResult result = await _auth.signInWithCredential(credential)
      FirebaseUser user = result.user;
      return _userFromFirebase;
    
    
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}