import 'package:flutter/material.dart';

class ChatMenu extends StatelessWidget {
  const ChatMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatScreen();
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Chats',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                // color: Colors.yellow,
                size: 30,
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
    );
  }

  void _navigateToChatScreen(BuildContext context, String userName) {
    print('Selected user: $userName');
    // Navigate to the chat screen or perform any action here
  }
}
