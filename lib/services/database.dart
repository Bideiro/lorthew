import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userinf.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid}); //yung required dito
//collection reference

  // final CollectionReference pupilUserdataCollection =
  //     FirebaseFirestore.instance.collection('PuData');

  // final CollectionReference tutorUserdataCollection =
  //     FirebaseFirestore.instance.collection('TuData');

  final CollectionReference userdataCollection =
      FirebaseFirestore.instance.collection('UData');

  //initial pupil data
  Future initPUserData(String fname, String lname, String email) async {
    return await userdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'isTuTor': false,
      'uid': uid,
      'email': email
    });
  }

  // initial tutor data
  Future initTUserData(String fname, String lname, String email) async {
    return await userdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'isTutor': true,
      'uid': uid,
      'email': email
    });
  }

  //changing main user data for pupil
  Future updatePUserData(String fname, String lname, String aboutMe,
      String email, String phoneNum, String location) async {
    return await userdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'abtme': aboutMe,
      'email': email,
      'phono': phoneNum,
      'loc': location,
      'uid': uid,
    });
  }

//changing main user data for pupil
  Future updateTUserData(String fname, String lname, String aboutMe,
      String email, String phoneNum, String location, String subj) async {
    return await userdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'abtme': aboutMe,
      'email': email,
      'phono': phoneNum,
      'loc': location,
      'subj': subj,
    });
  }

// //list of the data in docs for pupil

//user data from snpashot

  pupilUserinfo _pupiluDataFromSnapshot(DocumentSnapshot snapshot) {
    return pupilUserinfo(
      uid: uid,
      fname: snapshot.get('fname'),
      lname: snapshot.get('lname'),
      abtme: snapshot.get('abtme'),
      email: snapshot.get('email'),
      phono: snapshot.get('phono'),
      loc: snapshot.get('loc'),
    );
  }

// get pupil data stream
  Stream<pupilUserinfo?> get PuDatadoc {
    return userdataCollection.doc(uid).snapshots().map(_pupiluDataFromSnapshot);
  }

// // get tutor data stream
//   Stream<List<tutorUserinfo>?> get TuData {
//     return pupilUserdataCollection.snapshots().map(_udataFromSnapshot);
//   }

  //get userdata firebase doc

  // Stream<DocumentSnapshot> get PuDatadoc {
  //   return pupilUserdataCollection.doc(uid).snapshots();
  // }
}
