abstract class MessageState {
  final bool isLoading;

  const MessageState({required this.isLoading});
}

class MessageStateInit extends MessageState {
  MessageStateInit({super.isLoading = false});
}

class MessageStateLoaded extends MessageState {
  MessageStateLoaded({super.isLoading = false});
}