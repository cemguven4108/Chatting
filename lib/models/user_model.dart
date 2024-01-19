import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? image;
  final Timestamp lastActive;
  final bool isOnline;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.image,
    required this.lastActive,
    this.isOnline = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      image: json["image"],
      lastActive: json["lastActive"],
      isOnline: json["isOnline"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "email": email,
      "isOnline": isOnline,
      "lastActive": lastActive,
    };
  }
}
