import '../../../../Models/MessagesModel/MessagesModel.dart';

abstract class ChatState {
  const ChatState();
}

class ChatInitialState extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoadedSuccess extends ChatState {
  final ChatResponse chatResponse;

  ChatLoadedSuccess(this.chatResponse);
}

class ChatError extends ChatState {
  final String message;

  const ChatError({required this.message});
}
