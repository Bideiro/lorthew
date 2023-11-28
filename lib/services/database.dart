import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userinf.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid}); //yung required dito
//collection reference

  final CollectionReference pupilUserdataCollection =
      FirebaseFirestore.instance.collection('PuData');

        final CollectionReference pupilPserdataCollection =
      FirebaseFirestore.instance.collection('TuData');
  //initial pupil data
  Future initPUserData(String fname, String lname) async {
    return await pupilUserdataCollection
        .doc(uid)
        .set({'fname': fname, 'lname': lname});
  }
  // initial tutor data
  Future initTUserData(String fname, String lname) async {
    return await pupilUserdataCollection
        .doc(uid)
        .set({'fname': fname, 'lname': lname});
  }
  //changing main user data for pupil
  Future updatePUserData(String fname, String lname, String aboutMe,
      String email, String phoneNum, String location) async {
    return await pupilUserdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'aboutMe': aboutMe,
      'email': email,
      'phoneNum': phoneNum,
      'location': location,
    });
  }

  
//changing main user data for pupil
  Future updateTUserData(String fname, String lname, String aboutMe,
      String email, String phoneNum, String location) async {
    return await pupilUserdataCollection.doc(uid).set({
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
    return pupilUserdataCollection.snapshots().map(_udataFromSnapshot);
  }
}
