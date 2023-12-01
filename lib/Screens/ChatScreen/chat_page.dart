  import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lorthew/services/chat_service.dart';

  class ChatPage extends StatefulWidget {
    final String receiverUserEmail;
    final String receiverUserID;
    final String receiverfullname;
    const ChatPage(
        {super.key,
          required this.receiverUserEmail,
          required this.receiverUserID,
          required this.receiverfullname});

    @override
    State<ChatPage> createState() => _ChatPageState();
  }

  class _ChatPageState extends State<ChatPage> {
    final TextEditingController _messageController = TextEditingController();
    final ChatService _chatService = ChatService();
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FocusNode _focusNode = FocusNode();

    bool showFirstTimeMessageButton = false;
    bool buttonClicked = false;

    StreamController<bool> _buttonVisibilityController = StreamController<bool>.broadcast();

    @override
    void initState() {
      super.initState();
      checkFirstTimeMessaging();
    }

    Future<void> checkFirstTimeMessaging() async {
      bool hasSentMessage = await _chatService.hasSentMessage(
        _firebaseAuth.currentUser!.uid,
        widget.receiverUserID,
      );

      setState(() {
        showFirstTimeMessageButton = !hasSentMessage && !buttonClicked;
        _buttonVisibilityController.add(showFirstTimeMessageButton);
      });
    }

    void sendMessage() async {
      String trimmedMessage = _messageController.text.trim();
      if (trimmedMessage.isNotEmpty) {
        await _chatService.sendMessage(
          widget.receiverUserID,
          trimmedMessage,
          widget.receiverfullname,
        );

        setState(() {
          buttonClicked = true;
          showFirstTimeMessageButton = false;
          _buttonVisibilityController.add(showFirstTimeMessageButton);
        });

        _messageController.clear();
      }
    }

    void sendWaveEmoji() {
      String waveEmoji = '👋';
      _chatService.sendMessage(
        widget.receiverUserID,
        waveEmoji,
        widget.receiverfullname,
      );

      setState(() {
        buttonClicked = true;
        showFirstTimeMessageButton = false;
        _buttonVisibilityController.add(showFirstTimeMessageButton);
      });
    }

    @override
    void dispose() {
      _buttonVisibilityController.close();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(title: Text(widget.receiverfullname)),
          body: Column(
            children: [
              StreamBuilder<bool>(
                stream: _buttonVisibilityController.stream,
                initialData: showFirstTimeMessageButton,
                builder: (context, snapshot) {
                  return snapshot.data!
                      ? ElevatedButton(
                    onPressed: sendWaveEmoji,
                    child: Text('Send a Wave 👋'),
                  )
                      : Container();
                },
              ),
              Expanded(
                child: _buildMessageList(),
              ),
              _buildMessageInput(),
            ],
          ),
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


    Widget _buildMessageItem(DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;

      var isCurrentUser = (data['senderId'] == _firebaseAuth.currentUser!.uid);
      var alignment = isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
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
                  topLeft: isCurrentUser ? Radius.circular(12.0) : Radius.circular(0.0),
                  topRight: isCurrentUser ? Radius.circular(0.0) : Radius.circular(12.0),
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
                    sendMessage();
                    _focusNode.requestFocus();
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }

  }
