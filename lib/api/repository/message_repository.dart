import 'package:chatting_app/api/repository/base_repository.dart';
import 'package:chatting_app/constants/collection_names.dart';
import 'package:chatting_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository extends BaseRepository<MessageModel> {
  final CollectionReference<MessageModel> _collection;

  MessageRepository._privateConstructor(this._collection) : super(_collection);

  static final MessageRepository _instance =
      MessageRepository._privateConstructor(FirebaseFirestore.instance
          .collection(Collections.MESSAGES)
          .withConverter<MessageModel>(
            fromFirestore: (snapshot, _) =>
                MessageModel.fromJson(snapshot.data()!),
            toFirestore: (model, options) => model.toJson(),
          ));

  factory MessageRepository.instance() {
    return _instance;
  }

  @override
  Future<QuerySnapshot<MessageModel>> getAll() async {
    return _collection.get();
  }
}
