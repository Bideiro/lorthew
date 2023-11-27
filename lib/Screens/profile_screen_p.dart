import 'package:flutter/material.dart';
import 'package:lorthew/Screens/all.dart';

import '../services/auth.dart';

// class ProfileScreenP extends StatelessWidget {
//   const ProfileScreenP({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: getUserDataFromFirestore(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic>? data =
//               snapshot.data?.data() as Map<String, dynamic>?;
//           print("User Data: $data");
//           return ProfilePage(userData: data);
//         } else {
//           print("Loading User Data...");
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }

// Future<DocumentSnapshot> getUserDataFromFirestore() async {
//   User? user = FirebaseAuth.instance.currentUser;
//   final documentSnapshot =
//       await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
//   print("User ID: ${user?.uid}");
//   return documentSnapshot;
// }

class ProfileScreenP extends StatelessWidget {
  // final Map<String, dynamic>? userData;

  // const ProfilePage({super.key, required this.userData});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // print("Building Profile Page with User Data: $userData");
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
                MaterialPageRoute(builder: (context) => ProfileEditP()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20.0),
            Text(
              'John Doe',
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
                'I am a passionate software developer with a keen interest in mobile application development.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Divider(),
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
              title: Text('Email: john.doe@example.com'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone: +1234567890'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location: City, Country'),
            ),
          ],
        ),
      ),
    );
  }
}
