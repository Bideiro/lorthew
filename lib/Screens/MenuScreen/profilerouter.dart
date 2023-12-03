import 'package:flutter/material.dart';
import 'package:lorthew/Screens/ProfileScreenT/profile_screen_t.dart';
import 'package:lorthew/filedependencies/profilescreenpall.dart';
import 'package:lorthew/models/cuser.dart';
import 'package:lorthew/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/userinf.dart';

class ProfileRouter extends StatefulWidget {
  const ProfileRouter({super.key});

  @override
  State<ProfileRouter> createState() => ProfileRouterState();
}

class ProfileRouterState extends State<ProfileRouter> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<cUser?>(context);
    return StreamBuilder<Userinfo?>(
        stream: DatabaseService(uid: user?.uid).uDatadoc,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading...');
          }
          if (snapshot.hasData) {
            Userinfo? userData = snapshot.data;
            if (userData!.isTutor == true) {
              return ProfileScreenT();
            } else if (userData.isTutor == false) {
              return ProfileScreenP();
            }
          }
          print("no has data");
          return Authenticate();
        });
  }
}
