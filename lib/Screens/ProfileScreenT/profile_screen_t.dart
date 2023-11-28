import 'package:flutter/material.dart';
import 'package:lorthew/Screens/ProfileScreenT/profile_edit_t.dart';

import '../../services/auth.dart';

class ProfileScreenT extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MaterialPageRoute(builder: (context) => ProfileEditT()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('ProfileImageURL'),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('ImageURL1'),
                    ),
                    Text("Subject"),
                  ],
                ),
                SizedBox(width: 50.0),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('ImageURL2'),
                    ),
                    Text("Experience"),
                  ],
                ),
                SizedBox(width: 50.0),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('ImageURL3'),
                    ),
                    Text("Price"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
              ],
            ),
            const SizedBox(height: 15.0),
            const Text(
              'About Me',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'I am a passionate software developer with a keen interest in mobile application development.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email: john.doe@example.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone: +1234567890'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location: City, Country'),
            ),
          ],
        ),
      ),
    );
  }
}

