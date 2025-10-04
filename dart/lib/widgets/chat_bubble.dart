import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;

  const ChatBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(8), child: Text(text));
  }
}
