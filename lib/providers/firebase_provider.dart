import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  List<UserModel> users = [];

  List<UserModel> getAllUsers() {
    firebaseFireStore
        .collection("users")
        .orderBy("lastActive", descending: true)
        .snapshots(includeMetadataChanges: true)
        .listen((users) {
      this.users = users.docs
          .map(
            (doc) => UserModel.fromJson(doc.data()),
          )
          .toList();
      notifyListeners();
    });

    return users;
  }
}
