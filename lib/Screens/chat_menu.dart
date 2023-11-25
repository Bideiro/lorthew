import 'package:flutter/material.dart';
<<<<<<< HEAD

class ChatMenu extends StatelessWidget {
  const ChatMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatScreen();
=======
import 'package:lorthew/Screens/all.dart';

class ChatMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChatScreen();
>>>>>>> 78bfe58 (Test version 1)
  }
}

class ChatScreen extends StatefulWidget {
<<<<<<< HEAD
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

=======
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
>>>>>>> 78bfe58 (Test version 1)
  final List<String> users = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Emma',
    'Frank',
    // Add more users as needed
  ];

  List<String> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
  }

  void _filterUsers(String query) {
    setState(() {
      filteredUsers = users
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Chats',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
        ),
=======
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true, // Aligns the title in the center of the AppBar
>>>>>>> 78bfe58 (Test version 1)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
<<<<<<< HEAD
              icon: const Icon(
                Icons.notifications,
                // color: Colors.yellow,
                size: 30,
=======
              icon: Icon(
                Icons.notifications,
                color: Colors.yellow,
>>>>>>> 78bfe58 (Test version 1)
              ),
              onPressed: () {
                // Add functionality for the notification icon
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
<<<<<<< HEAD
          Column(
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
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
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
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
=======
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: _filterUsers,
            ),
          ),
>>>>>>> 78bfe58 (Test version 1)
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(filteredUsers[index][0]),
                  ),
                  title: Text(filteredUsers[index]),
                  onTap: () {
                    _navigateToChatScreen(context, filteredUsers[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
<<<<<<< HEAD
=======
      bottomNavigationBar: CustomNavBar(),
>>>>>>> 78bfe58 (Test version 1)
    );
  }

  void _navigateToChatScreen(BuildContext context, String userName) {
    print('Selected user: $userName');
    // Navigate to the chat screen or perform any action here
  }
}
