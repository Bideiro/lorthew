import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileService extends ChangeNotifier {
  final String? uid;
  ProfileService({this.uid});
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final CollectionReference userdataCollection =
      FirebaseFirestore.instance.collection('UData');

  //GET MESSAGES
  DocumentReference<Map<String, dynamic>> getprofile(String userId) {
    return _fireStore.collection('UData').doc(userId);
  }


  Stream<DocumentSnapshot> get uDatadoc {
    return userdataCollection.doc(uid).snapshots();
  }
}
