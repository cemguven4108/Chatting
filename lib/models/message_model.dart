class MessageModel {
  final String content;
  final DateTime sentTime;
  final String senderId;
  final String receiverId;

  MessageModel({
    required this.content,
    required this.sentTime,
    required this.senderId,
    required this.receiverId,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json["content"] as String,
      sentTime: json["sentTime"] as DateTime,
      senderId: json["senderId"] as String,
      receiverId: json["receiverId"] as String,
    );
  }
}