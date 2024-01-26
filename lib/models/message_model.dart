import 'package:chatting_app/models/entity.dart';

class MessageModel extends Entity {
  final String content;
  final DateTime sentTime;
  final String senderId;
  final String receiverId;

  MessageModel({
    required String id,
    required this.content,
    required this.sentTime,
    required this.senderId,
    required this.receiverId,
  }) : super(id: id);

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"] as String,
      content: json["content"] as String,
      sentTime: json["sentTime"] as DateTime,
      senderId: json["senderId"] as String,
      receiverId: json["receiverId"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'sentTime': sentTime,
        'senderId': senderId,
        'receiverId': receiverId,
      };
}
