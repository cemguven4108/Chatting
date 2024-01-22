import 'package:chatting_app/constants/collection_names.dart';
import 'package:chatting_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseStorage.instance;

final usersCollection = FirebaseFirestore.instance
    .collection(Collections.USERS)
    .withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );

final messagesCollection = FirebaseFirestore.instance.collection(Collections.MESSAGES);