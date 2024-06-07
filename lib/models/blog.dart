import 'package:blog_app/models/comment.dart';
import 'package:flutter/material.dart';

enum BlogCategory {
  technology,
  education,
  engineering,
  medical,
}

const categoryColors = {
  BlogCategory.education: Colors.blue,
  BlogCategory.technology: Colors.deepPurple,
  BlogCategory.medical: Colors.deepOrange,
  BlogCategory.engineering: Colors.green,
};

class Blog {
  final String title;
  final String content;
  final DateTime createdAt;
  bool saved;
  final BlogCategory category;
  final String image;
  final String author;
  final List<Comment> coments;

  Blog(this.category, this.image, this.author, this.coments,
      {required this.title,
      required this.content,
      required this.createdAt,
      this.saved = false});

  String get getTitle => 'blog title: $title';
}
