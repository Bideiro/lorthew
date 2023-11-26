import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../Main.dart';
// problem: overflow, right side, when home

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> with AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<Widget> _children = <Widget>[
    Lorthew(),
  ];

    if (ModalRoute.of(context)?.settings.name == '/home') {
      _selectedIndex = 0;
    } else if (ModalRoute.of(context)?.settings.name == '/chat') {
      _selectedIndex = 1;
    } else if (ModalRoute.of(context)?.settings.name == '/schedule') {
      _selectedIndex = 2;
    } else if (ModalRoute.of(context)?.settings.name == '/payment') {
      _selectedIndex = 3;
    } else if (ModalRoute.of(context)?.settings.name == '/profile') {
      _selectedIndex = 4;
    }

    return GNav(
      rippleColor: Colors.grey[300]!,
      hoverColor: const Color.fromARGB(255, 34, 16, 16),
      tabActiveBorder: Border.all(color: const Color(0xff4cc55c), width: 1),
      gap: 8,
      iconSize: 24,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      duration: const Duration(milliseconds: 600),
      tabs: [
        GButton(
          icon: LineIcons.home,
          text: 'Home',
          iconColor: const Color.fromRGBO(16, 48, 89, 1),
          onPressed: () {
          Navigator.pop(context, MaterialPageRoute(builder: (context) => Lorthew()),);
          },
        ),
        GButton(
          icon: LineIcons.commentAlt,
          text: 'Chat',
          onPressed: () {
            Navigator.pushNamed(context, '/chat');
          },
        ),
        GButton(
          icon: LineIcons.calendar,
          text: 'Schedule',
          onPressed: () {
            Navigator.pushNamed(context, '/schedule');
          },
        ),
        GButton(
          icon: LineIcons.receipt,
          text: 'Pay',
          onPressed: () {
            Navigator.pushNamed(context, '/payment');
          },
        ),
        GButton(
          icon: LineIcons.user,
          text: 'Profile',
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
      selectedIndex: _selectedIndex,
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

}
