import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lorthew/Screens/PaymentScreenP/payment_history_t.dart';
import 'package:lorthew/Screens/PaymentScreenP/payment_screen_p_2.dart';

import '../../filedependencies/profilescreenpall.dart';

class PaymentScreenP extends StatefulWidget {
  const PaymentScreenP({super.key});

  @override
  State<PaymentScreenP> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreenP> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> items = [
    'John Smith',
    'Alice Johnson',
  ];

  List<String> filteredItems = [];
  int? selectedItemIndex;

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pay Tutor',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.history,
              // color: Color.fromRGBO(16, 48, 89, 1),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentHistoryScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              // color: Color.fromRGBO(16, 48, 89, 1),
            ),
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
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
                        onTap: () {},
                        onChanged: _filterItems,
                        leading: const Icon(Icons.search),
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return filteredItems.map((item) {
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      }).toList();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(child: _buildUserListPayment())
        ],
      ),
    );
  }

  Widget _buildUserListPayment() {
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

  Widget _buildTutorList(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //getting non current user data
    if (_auth.currentUser!.email != data['email'] && data['isTutor'] == true) {
      String rfullname = data['fname'] + ' ' + data['lname'];
      String remail = data['email'];

      //displaying non current user data
      if (rfullname.isNotEmpty && remail.isNotEmpty) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(rfullname[0].toUpperCase()),
          ),
          title: Text(rfullname),
          subtitle: Text(remail),
          onTap: () {
            //Tutor page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentScreenP2(
                  tutorfname: data['fname'],
                  tutorlname: data['lname'],
                  currfname: 'test',
                  currlname: 'test',
                  tutoremail: data['email'],
                  currphono: 'testest',
                  tutorphono: data['phono'],
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
