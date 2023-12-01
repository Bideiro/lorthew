import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lorthew/Screens/ChatScreen/chat_page.dart';

import '../../services/chat_service.dart';

class ChatMenu extends StatefulWidget {
  const ChatMenu({super.key});

  @override
  State<ChatMenu> createState() => _ChatMenuState();
}

class _ChatMenuState extends State<ChatMenu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Chats',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {

                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildUserList(),
          ),
        ],
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

    if (_auth.currentUser!.uid != data['uid']) {
      String rfullname = data['fname'] + ' ' + data['lname'];
      String remail = data['email'];

      if (rfullname.isNotEmpty && remail.isNotEmpty) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(rfullname[0].toUpperCase()),
          ),
          title: Text(rfullname),
          subtitle: StreamBuilder<QuerySnapshot>(
            stream: _chatService.getMessages(
              _auth.currentUser!.uid,
              data['uid'],
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('loading...');
              }

              var messages = snapshot.data!.docs;
              if (messages.isNotEmpty) {
                var latestMessage = messages.last['message'];
                var timestamp = messages.last['timestamp'];
                var formattedTime = _formatRelativeTime(timestamp);

                bool isCurrentUserSender = messages.last['senderId'] == _auth.currentUser!.uid;

                bool shouldAdjustWidth = latestMessage.length > 20;

                return Row(
                  children: [
                    Container(
                      width: shouldAdjustWidth ? MediaQuery.of(context).size.width * 0.45 : null,
                      child: Text(
                        isCurrentUserSender ? 'You: $latestMessage' : latestMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      formattedTime,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                );
              } else {
                return Text(
                  'Say hi! 👋',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                );
              }
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
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

  String _formatRelativeTime(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inDays > 0) {
      return DateFormat('MMM d, yyyy').format(dateTime);
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Just now';
    }
  }

}
