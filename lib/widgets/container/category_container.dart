import 'package:blog_app/models/blog.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key, required this.category, required this.isActive});
  final BlogCategory category;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category.name,
        style: TextStyle(
            color: isActive ? Colors.white : categoryColors[category]),
      ),
    );
  }
}
