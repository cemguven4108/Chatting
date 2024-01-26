import 'package:chatting_app/api/bloc/message/message_event.dart';
import 'package:chatting_app/api/bloc/message/message_state.dart';
import 'package:chatting_app/api/service/auth_service.dart';
import 'package:chatting_app/api/service/message_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageService _messageService;
  final AuthService _authService;

  MessageBloc(this._messageService, this._authService)
      : super(MessageStateInit()) {}


  void _onGetMessages(MessageEventGetMessages event, Emitter<MessageState> emit) async {
    
  }
}
