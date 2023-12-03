import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../all.dart';
import 'Profile_page_t.dart';
import 'profilerouter.dart';

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
    ProfileRouter(),
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

class CurvePainter extends CustomPainter{
  Color colorOne = const Color(0xFF2196F3);
  Color colorTwo = const Color(0xFF1976D2);
  Color colorThree = const Color(0xFF1565C0);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();


    path.lineTo(0, size.height *0.75);
    path.quadraticBezierTo(size.width* 0.10, size.height*0.70,   size.width*0.17, size.height*0.90);
    path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
    path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
    path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
    path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width, 0);
    path.close();

    paint.color = colorThree!;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height*0.50);
    path.quadraticBezierTo(size.width*0.10, size.height*0.80, size.width*0.15, size.height*0.60);
    path.quadraticBezierTo(size.width*0.20, size.height*0.45, size.width*0.27, size.height*0.60);
    path.quadraticBezierTo(size.width*0.45, size.height, size.width*0.50, size.height*0.80);
    path.quadraticBezierTo(size.width*0.55, size.height*0.45, size.width*0.75, size.height*0.75);
    path.quadraticBezierTo(size.width*0.85, size.height*0.93, size.width, size.height*0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorTwo!;
    canvas.drawPath(path, paint);

    path =Path();
    path.lineTo(0, size.height*0.75);
    path.quadraticBezierTo(size.width*0.10, size.height*0.55, size.width*0.22, size.height*0.70);
    path.quadraticBezierTo(size.width*0.30, size.height*0.90, size.width*0.40, size.height*0.75);
    path.quadraticBezierTo(size.width*0.52, size.height*0.50, size.width*0.65, size.height*0.70);
    path.quadraticBezierTo(size.width*0.75, size.height*0.85, size.width, size.height*0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorOne;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}

class CurvePainterBackground extends StatelessWidget {
  final double diameter;

  const CurvePainterBackground({Key? key, this.diameter = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(),
      size: Size(diameter, diameter),
    );
  }
}



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> synonyms = [
    'Lorthew',
    'Instructor',
    'Professor',
    'Tutor',
    'Lecturer',
    'Educator',
    'Mentor',
    'Coach',
    'Guide',
    'Facilitator',
    'Trainer',
    'Preceptor',
    'Teacher',
    'Disciplinarian',
    'Scholar',
    'Educationist',
    'Academic',
    'Adviser',
    'Counselor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2196F3),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Menu',
          style: TextStyle(
            fontFamily: 'Bebas',
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CurvePainterBackground(diameter: MediaQuery.of(context).size.width),
            // Main content
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Find your best',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: Duration(milliseconds: 1500),
                                enlargeCenterPage: true,
                                aspectRatio: 2.0,
                                height: 50.0,
                                scrollDirection: Axis.vertical,
                              ),
                              items: synonyms.map((item) => Text(
                                item,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: SearchAnchor(
                              builder: (BuildContext context, SearchController controller) {
                                return SearchBar(
                                  controller: controller,
                                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                                    EdgeInsets.symmetric(horizontal: 16.0),
                                  ),
                                  onTap: () {
                                    controller.openView();
                                  },
                                  onChanged: (_) {
                                    controller.openView();
                                  },
                                  leading: const Icon(Icons.search),
                                );
                              },
                              suggestionsBuilder: (BuildContext context, SearchController controller) {
                                return List<ListTile>.generate(5, (int index) {
                                  final String item = 'item $index';
                                  return ListTile(
                                    title: Text(item),
                                    onTap: () {
                                      setState(() {
                                        controller.closeView(item);
                                      });
                                    },
                                  );
                                });
                              },
                            ),
                          ),
                          // IconButton(
                          //   icon: const Icon(Icons.filter_list),
                          //   onPressed: () {
                          //     // Add your filter button functionality here
                          //   },
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildUserList(),
                ),
              ],
            ),
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
              .map<Widget>((doc) => _buildTutorList(doc))
              .toList(),
        );
      },
    );
  }

  // Main menu list
  Widget _buildTutorList(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // Getting non-current user data
    if (_auth.currentUser!.email != data['email']) {
      String rfullname = data['fname'] + ' ' + data['lname'];
      String remail = data['email'];

      // Displaying non-current user data
      if (rfullname.isNotEmpty && remail.isNotEmpty) {
        return Container(
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // Place the CircleAvatar here
              CircleAvatar(
                radius: 40.0,
                child: Text(rfullname[0].toUpperCase()),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    toTitleCase(rfullname),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    remail,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  onTap: () {
                    // Tutor page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutorPage(
                          lname: data['lname'],
                          fname: data['fname'],
                          abtme: data['abtme'],
                          email: data['email'],
                          phono: data['phono'],
                          loc: data['loc'],
                          uid: data['uid'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }


  String toTitleCase(String text) {
    return text.toLowerCase().split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      } else {
        return '';
      }
    }).join(' ');
  }

}
