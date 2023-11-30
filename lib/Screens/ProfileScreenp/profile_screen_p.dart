import 'package:flutter/material.dart';
import 'package:lorthew/Screens/ProfileScreenp/dynamic_profilescreenp.dart';
import 'package:lorthew/Screens/all.dart';
import 'package:provider/provider.dart';

import '../../loading.dart';
import '../../models/userinf.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '/models/cuser.dart';

class ProfileScreenP extends StatelessWidget {
  final AuthService _auth = AuthService();

  ProfileScreenP({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<cUser?>(context);

    // print("Building Profile Page with User Data: $userData");
    return StreamBuilder<PupilUserinfo?>(
        stream: DatabaseService(uid: user?.uid).PuDatadoc,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PupilUserinfo? userData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Profile',
                  style: TextStyle(
                      fontFamily: 'Bebas',
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  tooltip: 'Logout',
                  onPressed: () async {
                    await _auth.signMeOut();
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.mode_edit,
                      size: 30,
                    ),
                    tooltip: 'Edit Profile',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileEditP()),
                      );
                    },
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      child: Text(
                          userData!.fname[0].toUpperCase(),
                        style: TextStyle(
                          fontSize: 50.0
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      userData!.fname+ ' ' +userData!.lname,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        userData!.abtme,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Divider(),
                    dynamicprofilescreenp(),
                    SizedBox(height: 20.0),
                    Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email: ${userData!.email}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone: +63 9${userData!.phono}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Location: ${userData!.loc}'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
