import 'package:flutter/material.dart';
import 'package:lorthew/Screens/all.dart';
import 'package:provider/provider.dart';

import '../../models/cuser.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: Authenticate()));
}

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final cUser? user = Provider.of<cUser?>(context);
    print(user);

    if (user == null) {
      return LoginScreen();
    } else {
      return MenuScreen();
    }
  }
}
