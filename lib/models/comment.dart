class Comment {
  final String content;
  final DateTime createdAt;
  final String author;
  final String userImg;

  Comment(this.userImg,
      {required this.content, required this.createdAt, required this.author});
}
