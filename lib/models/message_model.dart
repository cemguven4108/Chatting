class MessageModel {
  final String message;
  final String senderId;
  final String receiverId;

  MessageModel({
    required this.message,
    required this.senderId,
    required this.receiverId,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json["message"] as String,
      senderId: json["senderId"] as String,
      receiverId: json["receiverId"] as String,
    );
  }
}