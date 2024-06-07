import 'package:blog_app/data/data.dart';
import 'package:blog_app/models/comment.dart';
import 'package:flutter/material.dart';

import '../models/blog.dart';

class BlogProvider extends ChangeNotifier {
  List<Blog> blogs = dummyDatas;
  List<Blog> savedBlogs = [];

  List<Blog> get getBlogs => blogs;

  void addBlog(Blog blog) {
    blogs.add(blog);
    notifyListeners();
  }

  List<Blog> getLatestBlogs(List<BlogCategory> filter) {
    List<Blog> filteredBlogs = blogs;

    final now = DateTime.now();

    if (filter.isNotEmpty) {
      filteredBlogs =
          blogs.where((blog) => filter.contains(blog.category)).toList();

      filteredBlogs = filteredBlogs.where((blog) {
        final timeDifference = now.difference(blog.createdAt);
        return timeDifference.inDays <= 7;
      }).toList();

      filteredBlogs.sort((b, a) => a.createdAt.day.compareTo(b.createdAt.day));

      return filteredBlogs;
    }
    // filter last 7 days blog
    filteredBlogs = filteredBlogs.where((blog) {
      final timeDifference = now.difference(blog.createdAt);
      return timeDifference.inDays <= 7;
    }).toList();
    //sort in descending order
    filteredBlogs.sort((b, a) => a.createdAt.compareTo(b.createdAt));
    return filteredBlogs;
  }

  List<Blog> getPopularBlogs(List<BlogCategory> filter) {
    final filteredBlogs = blogs;

    if (filter.isNotEmpty) {
      // first filter list based on setfilters
      final filteredBlogs =
          blogs.where((blog) => filter.contains(blog.category)).toList();
      // sort filtered blogs based on comments
      filteredBlogs.sort((blog2, blog1) {
        final blog1CommentCount = blog1.coments.length;
        final blog2CommentCount = blog2.coments.length;
        return blog2CommentCount.compareTo(blog1CommentCount);
      });
      return filteredBlogs;
    }
    filteredBlogs.sort((blog2, blog1) {
      final blog1CommentCount = blog1.coments.length;
      final blog2CommentCount = blog2.coments.length;
      return blog2CommentCount.compareTo(blog1CommentCount);
    });
    return filteredBlogs;
  }

  List<Comment> getCommentsInOrder(Blog blog) {
    final sortedComments = blog.coments;
    sortedComments.sort((c2, c1) => c1.createdAt.compareTo(c2.createdAt));
    return sortedComments;
  }

  void addComment(Blog blog, Comment comment) {
    blog.coments.add(comment);
    notifyListeners();
  }

  void toggleSavedBlog(Blog blog) {
    if (!blog.saved && !savedBlogs.contains(blog)) {
      savedBlogs.add(blog);
    } else {
      savedBlogs.remove(blog);
    }

    blog.saved = !(blog.saved);
    notifyListeners();
  }
}
