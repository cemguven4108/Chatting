import 'package:chatting_app/api/repository/message_repository.dart';

class MessageService {
  final MessageRepository _messageRepository;

  const MessageService._privateConstructor(this._messageRepository);

  static final MessageService _instance = MessageService._privateConstructor(
    MessageRepository.instance(),
  );

  factory MessageService.instance() {
    return _instance;
  }
}
