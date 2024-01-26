import 'package:chatting_app/models/entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends Entity {
  final String fullName;
  final String email;
  final String imageUrl;
  final DateTime lastActive;
  final bool isOnline;

  UserModel({
    required String id,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.lastActive,
    this.isOnline = false,
  }) : super(id: id);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String,
      lastActive: json['lastActive'].toDate() as DateTime,
      isOnline: json['isOnline'] ?? false,
    );
  }

  factory UserModel.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> documents,
  ) {
    return UserModel.fromJson(documents.data()!);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'imageUrl': imageUrl,
        'lastActive': lastActive,
        'isOnline': isOnline,
      };
}
