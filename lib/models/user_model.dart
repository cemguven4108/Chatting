import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String imageUrl;
  final DateTime lastActive;
  final bool isOnline;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.lastActive,
    this.isOnline = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        fullName: json['fullName'] as String,
        email: json['email'] as String,
        imageUrl: json['imageUrl'] as String,
        lastActive: json['lastActive'].toDate() as DateTime,
        isOnline: json['isOnline'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'imageUrl': imageUrl,
        'lastActive': lastActive as Timestamp,
        'isOnline': isOnline,
      };
}
