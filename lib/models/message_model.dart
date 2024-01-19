import 'package:chatting_app/models/message_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String receiverId;
  final String content;
  final Timestamp sentTime;
  final MessageType messageType;

  const MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.sentTime,
    required this.messageType,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      receiverId: json["receiverId"],
      senderId: json["senderId"],
      sentTime: json["sentTime"],
      content: json["content"],
      messageType: MessageType.fromJson(json["messageType"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "receiverId": receiverId,
      "senderId": senderId,
      "sentTime": sentTime,
      "content": content,
      "messageType": messageType.toJson(),
    };
  }
}
