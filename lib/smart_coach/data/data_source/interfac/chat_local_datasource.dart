import 'package:fluter_chat_bot/smart_coach/domain/entites/chat_message.dart';

abstract class ChatLocalDataSource {
  Future<void> saveMessages(List<ChatMessage> messages);

  Future<List<ChatMessage>> getMessages();

  Future<void> clearMessages();
}
