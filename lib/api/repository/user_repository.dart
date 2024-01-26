
import 'package:chatting_app/api/repository/base_repository.dart';
import 'package:chatting_app/constants/collection_names.dart';
import 'package:chatting_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends BaseRepository<UserModel> {
  final CollectionReference<UserModel> _collection;

  UserRepository._privateConstructor(this._collection) : super(_collection);

  static final UserRepository _instance = UserRepository._privateConstructor(
      FirebaseFirestore.instance
          .collection(Collections.USERS)
          .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (model, options) => model.toJson(),
          ));

  factory UserRepository() {
    return _instance;
  }
}