// class Userinfo {
//   final String fname;
//   final String lname;

//   Userinfo({required this.fname,required this.lname});

// }

class Userinfo {
  final String fname;
  final String lname;
  final String abtme;
  final String email;
  final String phono;
  final String loc;
  final String subj;
  final int pricelvl;
  final int starno;
  final String exp;
  final String? uid;
  final bool isTutor;
  final String iconURL;

  Userinfo({
    required this.uid,
    required this.isTutor,
    required this.iconURL,
    required this.subj,
    required this.pricelvl,
    required this.starno,
    required this.exp,
    required this.fname,
    required this.lname,
    required this.abtme,
    required this.email,
    required this.phono,
    required this.loc,
  });
}
