import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lorthew/services/chat_service.dart';

class MenuPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  final String receiverfullname;
  const MenuPage(
      {super.key,
        required this.receiverUserEmail,
        required this.receiverUserID,
        required this.receiverfullname});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FocusNode _focusNode = FocusNode();

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
        title: const Text(
          'Pay Tutor',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
        ),
          
        automaticallyImplyLeading: false,
      ),
        body: Column(
          children: [
            Expanded(
              child: _buildMessageList(),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var isCurrentUser = (data['senderId'] == _firebaseAuth.currentUser!.uid);
    var alignment =
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    var backgroundColor = isCurrentUser ? Colors.blue : Colors.grey[200];
    var textColor = isCurrentUser ? Colors.white : Colors.black;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: isCurrentUser
                    ? Radius.circular(12.0)
                    : Radius.circular(0.0),
                topRight: isCurrentUser
                    ? Radius.circular(0.0)
                    : Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   data['senderEmail'],
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: textColor,
                //   ),
                // ),
                SizedBox(height: 4.0),
                Text(
                  data['message'],
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            _formatTimestamp(data['timestamp']),
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  focusNode: _focusNode,
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Enter message',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onSubmitted: (_) {},
                ),
              ),
              SizedBox(width: 8.0),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // sendMessage();
                  // _focusNode.requestFocus();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error' + snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        List reversedMessages = List.from(snapshot.data!.docs.reversed);
        return ListView(
          reverse: true,
          padding: EdgeInsets.all(8.0),
          children: reversedMessages
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }
}
