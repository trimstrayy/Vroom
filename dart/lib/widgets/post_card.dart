import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;

  const PostCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(padding: const EdgeInsets.all(16), child: Text(title)));
  }
}
