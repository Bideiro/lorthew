import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'all.dart';
import 'menu_page.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ChatMenu(),
    ScheduleScreenP(),
    PaymentScreenP(),
    ProfileScreenP(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  iconColor: const Color.fromRGBO(16, 48, 89, 1),
                  onPressed: () {},
                ),
                GButton(
                  icon: LineIcons.commentAlt,
                  text: 'Chat',
                  onPressed: () {},
                ),
                GButton(
                  icon: LineIcons.calendar,
                  text: 'Schedule',
                  onPressed: () {},
                ),
                GButton(
                  icon: LineIcons.receipt,
                  text: 'Pay',
                  onPressed: () {},
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                  onPressed: () {},
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // List<UserInfo> users = [
  //   UserInfo(
  //     name: "Ezra Sebastiansdadsada",
  //     role: "Math Tutor",
  //     description: "Sample description",
  //     imageUrl:
  //         'https://imageio.forbes.com/specials-images/imageserve/646a275546cda47733a0589b/Lee-Do-hyun/0x0.jpg?format=jpg&crop=1000,905,x0,y123,safe&width=960',
  //   ),
  //   UserInfo(
  //     name: "Mr. Ming",
  //     role: "Meowing 101",
  //     description: "Sample description",
  //     imageUrl:
  //         "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSGfpQ3m-QWiXgCBJJbrcUFdNdWAhj7rcUqjeNUC6eKcXZDAtWm",
  //   )
  // ];

  late List<UserInfo> filteredUsers;
  UserInfo? selectedUser;

  // @override
  // void initState() {
  //   super.initState();
  //   filteredUsers = List.from(_auth.ins);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SearchAnchor(
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SearchBar(
                          controller: controller,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (query) {
                            // setState(() {
                            //   filteredUsers = users
                            //       .where((user) => user.name
                            //           .toLowerCase()
                            //           .contains(query.toLowerCase()))
                            //       .toList();
                            // });
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(filteredUsers.length,
                            (int index) {
                          final UserInfo user = filteredUsers[index];
                          return ListTile(
                            // title: Text(user.name),
                            onTap: () {
                              // setState(() {
                              //   selectedUser = user;
                              //   filteredUsers = [user];
                              //   controller.closeView(user.name);
                              // });
                            },
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildUserList(),
            ),
            // if (selectedUser != null)
            //   ExpandableCard(
            //     user: selectedUser!,
            //   )
            // else
            //   for (var user in filteredUsers)
            //     ExpandableCard(
            //       user: user,
            //     ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('UData').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading...');
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (_auth.currentUser!.email != data['email']) {
      String rfullname = data['fname'] + ' ' + data['lname'];
      String remail = data['email'];

      if (rfullname.isNotEmpty && remail.isNotEmpty) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(rfullname[0].toUpperCase()),
          ),
          title: Text(rfullname),
          subtitle: Text(remail),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuPage(
                  receiverfullname: rfullname,
                  receiverUserEmail: remail,
                  receiverUserID: data['uid'],
                ),
              ),
            );
          },
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
}

// class UserInfo {
//   final String name;
//   final String role;
//   final String description;
//   final String imageUrl;

//   UserInfo({
//     required this.name,
//     required this.role,
//     required this.description,
//     required this.imageUrl,
//   });
// }

// class ExpandableCard extends StatelessWidget {
//   final UserInfo user;

//   const ExpandableCard({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer(
//       transitionType: ContainerTransitionType.fade,
//       transitionDuration: const Duration(milliseconds: 500),
//       openBuilder: (BuildContext context, VoidCallback openContainer) {
//         return FullScreenCard(user: user);
//       },
//       closedBuilder: (BuildContext context, VoidCallback openContainer) {
//         return Card(
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Image(
//                       image: NetworkImage(user.imageUrl),
//                       height: 100,
//                       width: 100,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (BuildContext context, Widget child,
//                           ImageChunkEvent? loadingProgress) {
//                         if (loadingProgress == null) {
//                           return child;
//                         } else {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//                       },
//                     ),
//                     Container(width: 20),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Container(height: 5),
//                           Text(
//                             user.name,
//                             style: TextStyle(
//                               fontStyle: FontStyle.italic,
//                               color: Colors.grey[800],
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           Container(height: 5),
//                           Text(
//                             user.role,
//                             style: TextStyle(
//                               fontStyle: FontStyle.italic,
//                               color: Colors.grey[500],
//                               fontSize: 14,
//                             ),
//                           ),
//                           Text(
//                             user.description,
//                             maxLines: 2,
//                             style: TextStyle(
//                               color: Colors.grey[500],
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class FullScreenCard extends StatelessWidget {
//   final UserInfo user;

//   const FullScreenCard({Key? key, required this.user}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(user.name),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             CircleAvatar(
//               radius: 50.0,
//               backgroundImage: NetworkImage(user.imageUrl),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               user.name,
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 15.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 20.0,
//                       backgroundImage: NetworkImage('ImageURL1'),
//                     ),
//                     Text("Subject"),
//                   ],
//                 ),
//                 SizedBox(width: 50.0),
//                 Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 20.0,
//                       backgroundImage: NetworkImage('ImageURL2'),
//                     ),
//                     Text("Experience"),
//                   ],
//                 ),
//                 SizedBox(width: 50.0),
//                 Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 20.0,
//                       backgroundImage: NetworkImage('ImageURL3'),
//                     ),
//                     Text("Price"),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
//                 Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
//                 Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
//                 Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
//                 Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
//               ],
//             ),
//             SizedBox(height: 15.0),
//             Text(
//               'About Me',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Text(
//                 'I am a passionate software developer with a keen interest in mobile application development.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//             SizedBox(height: 15.0),
//             Text(
//               'Contact Information',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             ListTile(
//               leading: Icon(Icons.email),
//               title: Text('Email: john.doe@example.com'),
//             ),
//             ListTile(
//               leading: Icon(Icons.phone),
//               title: Text('Phone: +1234567890'),
//             ),
//             ListTile(
//               leading: Icon(Icons.location_on),
//               title: Text('Location: City, Country'),
//             ),
//             SizedBox(height: 10.0),
//             SizedBox(
//               height: 50,
//               width: 300,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(const Color(0xFFFDD835)),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                 ),
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(LineIcons.calendarAlt, color: Colors.black),
//                       SizedBox(width: 10),
//                       Text(
//                         'Schedule a Lesson',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Row(
//                   children: <Widget>[
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         "Call",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         "Message",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildUserList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('UData').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text('error');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text('loading...');
//         }

//         return ListView(
//           children: snapshot.data!.docs
//               .map<Widget>((doc) => _buildUserListItem(doc))
//               .toList(),
//         );
//       },
//     );
//   }

//   Widget _buildUserListItem(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

//     if (_auth.currentUser!.email != data['email']) {
//       String rfullname = data['fname'] + ' ' + data['lname'];
//       String remail = data['email'];

//       if (rfullname.isNotEmpty && remail.isNotEmpty) {
//         return ListTile(
//           leading: CircleAvatar(
//             child: Text(rfullname[0].toUpperCase()),
//           ),
//           title: Text(rfullname),
//           subtitle: Text(remail),
//           onTap: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => ChatPage(
//             //       receiverfullname: rfullname,
//             //       receiverUserEmail: remail,
//             //       receiverUserID: data['uid'],
//             //     ),
//             //   ),
//             // );
//           },
//         );
//       } else {
//         return Container();
//       }
//     } else {
//       return Container();
//     }
//   }
// }
