import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userinf.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid}); //yung required dito
//collection reference

  final CollectionReference pupilUserdataCollection =
      FirebaseFirestore.instance.collection('PuData');

  final CollectionReference tutorUserdataCollection =
      FirebaseFirestore.instance.collection('TuData');
  //initial pupil data
  Future initPUserData(String fname, String lname) async {
    return await pupilUserdataCollection
        .doc(uid)
        .set({'fname': fname, 'lname': lname});
  }

  // initial tutor data
  Future initTUserData(String fname, String lname) async {
    return await tutorUserdataCollection
        .doc(uid)
        .set({'fname': fname, 'lname': lname});
  }

  //changing main user data for pupil
  Future updatePUserData(String fname, String lname, String aboutMe,
      String email, String phoneNum, String location) async {
    return await pupilUserdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'abtme': aboutMe,
      'email': email,
      'phono': phoneNum,
      'loc': location,
    });
  }

//changing main user data for pupil
  Future updateTUserData(String fname, String lname, String aboutMe,
      String email, String phoneNum, String location) async {
    return await pupilUserdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'abtme': aboutMe,
      'email': email,
      'phono': phoneNum,
      'loc': location,
    });
  }

//list of the data in docs for pupil

  List<pupilUserinfo>? _pupiluDataFromSnapsho(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return pupilUserinfo(
        uid: uid,
        fname: doc.get('fname') ?? '',
        lname: doc.get('lname') ?? '',
        abtme: doc.get('abtme') ?? '',
        email: doc.get('email') ?? '',
        phono: doc.get('phono') ?? '',
        loc: doc.get('loc') ?? '',
      );
    }).toList();
  }

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
    return pupilUserdataCollection
        .doc(uid)
        .snapshots()
        .map(_pupiluDataFromSnapshot);
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
