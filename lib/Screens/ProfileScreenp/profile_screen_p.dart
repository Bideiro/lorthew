
import 'package:flutter/material.dart';
import 'package:lorthew/Screens/ProfileScreenp/dynamic_profilescreenp.dart';
import 'package:lorthew/Screens/all.dart';
import 'package:provider/provider.dart';

import '../../models/userinf.dart';
import '../../services/auth.dart';
import '../../services/database.dart';

class ProfileScreenP extends StatelessWidget {
  final AuthService _auth = AuthService();

  ProfileScreenP({super.key});

  @override
  Widget build(BuildContext context) {
    // print("Building Profile Page with User Data: $userData");
    return StreamProvider<List<Userinfo>?>.value(
      value: DatabaseService().UData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
                fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
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
        body: const Center(
          child: dynamicprofilescreenp(),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     CircleAvatar(
          //       radius: 50.0,
          //       backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          //     ),
          //     SizedBox(height: 20.0),
          //     Text(
          //       'John Doe',
          //       style: TextStyle(
          //         fontSize: 24.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     SizedBox(height: 20.0),
          //     Text(
          //       'About Me',
          //       style: TextStyle(
          //         fontSize: 20.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(20.0),
          //       child: Text(
          //         'I am a passionate software developer with a keen interest in mobile application development.',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 16.0,
          //         ),
          //       ),
          //     ),
          //     Divider(),
          //     dynamicprofilescreenp(),
          //     SizedBox(height: 20.0),
          //     Text(
          //       'Contact Information',
          //       style: TextStyle(
          //         fontSize: 20.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     SizedBox(height: 10.0),
          //     ListTile(
          //       leading: Icon(Icons.email),
          //       title: Text('Email: john.doe@example.com'),
          //     ),
          //     Divider(),
          //     ListTile(
          //       leading: Icon(Icons.phone),
          //       title: Text('Phone: +1234567890'),
          //     ),
          //     Divider(),
          //     ListTile(
          //       leading: Icon(Icons.location_on),
          //       title: Text('Location: City, Country'),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
