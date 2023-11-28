import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lorthew/models/userinf.dart';

class Chat {
  final List<Userinfo> participantsInfo;
  final String lastMessage;
  final DateTime timestamp;

  Chat({
    required this.participantsInfo,
    required this.lastMessage,
    required this.timestamp,
  });

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      participantsInfo: (map['participants'] as List<dynamic>?)
          ?.map((participant) => Userinfo.fromMap(participant))
          .toList() ?? [],
      lastMessage: map['lastMessage'] ?? '',
      timestamp: (map['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

// factory Userinfo.fromMap(Map<String, dynamic> map) {
//   return Userinfo(
//     fname: map['fname'] ?? '',
//     lname: map['lname'] ?? '',
//   );
// }