class Userinfo {
  final String fname;
  final String lname;

  Userinfo({required this.fname,required this.lname});


// factory Userinfo.fromMap(Map<String, dynamic> map) {
//   return Userinfo(
//     fname: map['fname'] ?? '',
//     lname: map['lname'] ?? '',
//   );
// }
}

class UserData {
  final String fname;
  final String lname;
  final String abtme;
  final String email;
  final String phono;
  final String loc;

  UserData({
    required this.fname,
    required this.lname,
    required this.abtme,
    required this.email,
    required this.phono,
    required this.loc,
  });
}