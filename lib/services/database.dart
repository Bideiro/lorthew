import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lorthew/models/schedinfo.dart';

import '../models/userinf.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid}); //yung required dito
//collection reference

  final CollectionReference schedTdataCollection =
      FirebaseFirestore.instance.collection('Sched');

  final CollectionReference userdataCollection =
      FirebaseFirestore.instance.collection('UData');

  final FirebaseStorage _storage = FirebaseStorage.instance;

  //initial pupil data
  Future initPUserData(String fname, String lname, String email) async {
    return await userdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'isTutor': false,
      'uid': uid,
      'email': email,
      'iconURL': '',
    });
  }

  // initial tutor data
  Future initTUserData(String fname, String lname, String email) async {
    return await userdataCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'isTutor': true,
      'uid': uid,
      'email': email,
      'iconURL': '',
    });
  }

  //changing main user data
  // Future updateUserData(String fname, String lname, String aboutMe,
  //     String phoneNum, String location) async {
  //   return await userdataCollection.doc(uid).update({
  //     'fname': fname,
  //     'lname': lname,
  //     'abtme': aboutMe,
  //     'phono': phoneNum,
  //     'loc': location,
  //     'uid': uid,
  //   });
  // }

//changing main user data
  Future updateUserData(String fname, String lname, String aboutMe,
      String phoneNum, String location, String subj, String exp) async {
    return await userdataCollection.doc(uid).update({
      'fname': fname,
      'lname': lname,
      'abtme': aboutMe,
      'phono': phoneNum,
      'loc': location,
      'subj': subj,
      'exp': '',
      'pricelvl': 0,
      'starno': 0,
    });
  }

  //selecting icon
  Future updateIcon(ImageSource image) async {
    final ImagePicker imagepicker = ImagePicker();
    XFile? _file = await imagepicker.pickImage(source: image);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('no image ');
    }
  }

  Future<String> uploadImage(
      String filename, Uint8List file, String curruid) async {
    //uploading of image
    Reference ref = _storage.ref().child(filename);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot _snapshot = await uploadTask;
    String dlURL = await _snapshot.ref.getDownloadURL();
    try {
      updateIconDB(dlURL, curruid);
      return dlURL;
    } catch (e) {
      print(e);
      return 'asd';
    }
  }

  Future updateIconDB(String dlurl, String curruid) async {
    return await userdataCollection.doc(curruid).update({
      'iconURL': dlurl,
    });
  }

// //list of the data in docs for pupil
//user data from snapshot

  // PupilUserinfo _pupiluDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return PupilUserinfo(
  //     uid: uid,
  //     fname: snapshot.get('fname'),
  //     lname: snapshot.get('lname'),
  //     abtme: snapshot.get('abtme'),
  //     email: snapshot.get('email'),
  //     phono: snapshot.get('phono'),
  //     loc: snapshot.get('loc'),
  //     iconURL: snapshot.get('iconURL'),
  //     isTutor: snapshot.get('isTutor'),
  //   );
  // }

  // TutorUserinfo _tutoruDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return TutorUserinfo(
  //     uid: uid,
  //     fname: snapshot.get('fname'),
  //     lname: snapshot.get('lname'),
  //     abtme: snapshot.get('abtme'),
  //     email: snapshot.get('email'),
  //     phono: snapshot.get('phono'),
  //     loc: snapshot.get('loc'),
  //     iconURL: snapshot.get('iconURL'),
  //     isTutor: snapshot.get('isTutor'),
  //     subj: snapshot.get('subj'),
  //     pricelvl: snapshot.get('pricelvl'),
  //     starno: snapshot.get('starno'),
  //     exp: snapshot.get('exp'),);
  // }


Userinfo _uDataFromSnapshot(DocumentSnapshot snapshot) {
    return Userinfo(
      uid: uid,
      fname: snapshot.get('fname'),
      lname: snapshot.get('lname'),
      abtme: snapshot.get('abtme'),
      email: snapshot.get('email'),
      phono: snapshot.get('phono'),
      loc: snapshot.get('loc'),
      iconURL: snapshot.get('iconURL'),
      isTutor: snapshot.get('isTutor'),
      subj: snapshot.get('subj'),
      pricelvl: snapshot.get('pricelvl'),
      starno: snapshot.get('starno'),
      exp: snapshot.get('exp'),);
  }

  SchedToday _schedMFromSnapshot(DocumentSnapshot snapshot) {
    return SchedToday(
        tutoruid: snapshot.get('tutoruid'),
        tutor: snapshot.get('tutor'),
        pupiluid: snapshot.get('pupiluid'),
        pupil: snapshot.get('pupil'),
        time: snapshot.get('time'));
  }

// get pupil data stream
  // Stream<PupilUserinfo?> get PuDatadoc {
  //   return userdataCollection.doc(uid).snapshots().map(_pupiluDataFromSnapshot);
  // }

  Stream<Userinfo?> get uDatadoc {
    return userdataCollection.doc(uid).snapshots().map(_uDataFromSnapshot);
  }

  Stream<SchedToday> get SchedM {
    return schedTdataCollection
        .doc(uid)
        .collection('SchedM')
        .doc(uid)
        .snapshots()
        .map(_schedMFromSnapshot);
  }
}
