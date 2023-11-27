import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid}); //yung required dito
//collection reference

  final CollectionReference userdataCollection =
      FirebaseFirestore.instance.collection('UData');




  Future updateUserData( String fname, String lname) async {


    return await userdataCollection.doc(uid).set(
      {
        'fname' : fname,
        'lname' : lname
      }
    );
  }
}
