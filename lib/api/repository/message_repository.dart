
import 'package:chatting_app/models/message_model.dart';

class MessageRepository {
  Future<void> addMessage(MessageModel messageModel) async {
    return Future(() => true);
  }

  Future<void> updateMessage(MessageModel messageModel) async {
    return Future(() => true);
  }

  Future<void> deleteMessage(String id) async {
    return Future(() => true);
  }

  Future<MessageModel?> getMessage(String id) async {
    return Future(() => null);
  }

  Future<List<MessageModel>> getAllMessages() async {
    return Future(() => []);
  }
}