


import 'package:flutter/material.dart';
import 'package:lorthew/Screens/authentication/sign_in.dart';
import 'package:lorthew/services/auth.dart';


void main(List<String> args) {
  runApp(MaterialApp(
    home: Authenticate())
    );
}

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context){
    return Container(
      child: SignIn(),
    );
  }
}