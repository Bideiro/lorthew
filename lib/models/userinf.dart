// class Userinfo {
//   final String fname;
//   final String lname;

//   Userinfo({required this.fname,required this.lname});

// }

class PupilUserinfo {
  final String? uid;
  final String fname;
  final String lname;
  final String abtme;
  final String email;
  final String phono;
  final String loc;

  PupilUserinfo({
    required this.uid,
    required this.fname,
    required this.lname,
    required this.abtme,
    required this.email,
    required this.phono,
    required this.loc,
  });
}

class TutorUserinfo {
  final String fname;
  final String lname;
  final String abtme;
  final String email;
  final String phono;
  final String loc;
  // final String 

  TutorUserinfo({
    required this.fname,
    required this.lname,
    required this.abtme,
    required this.email,
    required this.phono,
    required this.loc,
  });
}
