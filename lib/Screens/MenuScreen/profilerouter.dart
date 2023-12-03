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
    final cUser? user = Provider.of<cUser?>(context);

    return StreamBuilder<PupilUserinfo?>(
        stream: DatabaseService(uid: user?.uid).PuDatadoc,
        builder: (context, snapshot) {
          PupilUserinfo? userData = snapshot.data;
          if (userData?.isTutor  == false) {
            print("going to profile for pupil");
            return ProfileScreenP();
          } else {
            print("going to profile for tutor");
            return ProfileScreenT();
          }
        });
  }
}
