import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userinf.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid}); //yung required dito
//collection reference

  final CollectionReference userdataCollection =
      FirebaseFirestore.instance.collection('UData');

  Future updateUserData(String fname, String lname) async {
    return await userdataCollection
        .doc(uid)
        .set({'fname': fname, 'lname': lname});
  }

  Future updateProfileData(String fname, String lname, String aboutMe,
      String email, String phoneNum, String location) async {
    return await userdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'aboutMe': aboutMe,
      'email': email,
      'phoneNum': phoneNum,
      'location': location,
    });
  }

//list of the data in docs

  List<Userinfo>? _udataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Userinfo(
          fname: doc.get('fname') ?? '', lname: doc.get('lname') ?? '');
    }).toList();
  }

// get UData stream

  Stream<List<Userinfo>?> get UData {
    return userdataCollection.snapshots().map(_udataFromSnapshot);
  }
}
