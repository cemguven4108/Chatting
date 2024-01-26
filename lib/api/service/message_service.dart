import 'package:chatting_app/api/repository/message_repository.dart';

class MessageService {
  final MessageRepository _messageRepository;

  const MessageService(this._messageRepository);
}