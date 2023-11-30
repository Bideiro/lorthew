import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lorthew/services/profile_service.dart';

class TutorPage extends StatefulWidget {
  final String fname;
  final String lname;
  final String abtme;
  final String email;
  final String phono;
  final String loc;
  final String uid;
  const TutorPage(
      {super.key,
        required this.fname,
        required this.lname,
        required this.abtme,
        required this.email,
        required this.phono,
        required this.loc,
        required this.uid});

  @override
  State<TutorPage> createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: Text(widget.lname)),
        body: Column(
          children: [
            Expanded(
              child: _buildProfileView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileView() {
    return StreamBuilder<DocumentSnapshot>(
      stream: ProfileService().PuDatadoc,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error' + snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('test'),
            ),
            SizedBox(height: 10.0),
            Text(
              widget.fname + widget.lname,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            Row(
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
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.abtme,
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
            ListTile(
              leading: const Icon(Icons.email),
              title: Text('Email: ' + widget.email),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text('Phone: +36 9' +  widget.phono),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location: ' + widget.loc),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button click
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFDD835)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LineIcons.calendarAlt, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Schedule a Lesson',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Call",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Message",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
      },
    );
  }
}
