import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lorthew/models/userinf.dart';

class Message {
  final Userinfo senderInfo;
  final String text;
  final DateTime timestamp;

  Message({
    required this.senderInfo,
    required this.text,
    required this.timestamp,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderInfo: Userinfo.fromMap(map['senderInfo'] ?? {}),
      text: map['text'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}