class Post {
  final String id;
  final String authorId;
  final String content;
  final String? mediaUrl;

  Post({required this.id, required this.authorId, required this.content, this.mediaUrl});
}
