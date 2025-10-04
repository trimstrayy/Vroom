class ChatMessage {
  final String id;
  final String senderId;
  final String text;
  final DateTime createdAt;

  ChatMessage({required this.id, required this.senderId, required this.text, required this.createdAt});
}
