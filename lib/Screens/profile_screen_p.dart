import 'package:flutter/material.dart';

class ProfileScreenP extends StatelessWidget {
  const ProfileScreenP({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfilePage();
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
          TextButton.icon(
            icon: const Icon(
              Icons.mode_edit,
              // color: Colors.black,
            ),
            label: Text("Edit Profile",selectionColor: Colors.black,),
            onPressed: () {
              // handle the press
            },
          )
        ],
        title:const  Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
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
