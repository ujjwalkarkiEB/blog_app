import 'package:blog_app/data/data.dart';
import 'package:blog_app/models/comment.dart';
import 'package:flutter/material.dart';

import '../models/blog.dart';
import '../models/user.dart';

class BlogProvider extends ChangeNotifier {
  List<Blog> blogs = dummyDatas;
  List<Blog> get getBlogs => blogs;

  void addBlog(Blog blog, User user) {
    user.createdBlogs.add(blog);
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
      filteredBlogs.sort((blog1, blog2) {
        final blog1LikeCount = blog1.likes;
        final blog2LikeCount = blog2.likes;
        return blog2LikeCount.compareTo(blog1LikeCount);
      });
      return filteredBlogs;
    }
    filteredBlogs.sort((blog1, blog2) {
      final blog1LikeCount = blog1.likes;
      final blog2LikeCount = blog2.likes;
      return blog2LikeCount.compareTo(blog1LikeCount);
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

  void toggleSavedBlog(Blog blog, User user) {
    final isLikedBlogs = user.likedBlogs.contains(blog);
    if (isLikedBlogs) {
      if (blog.likes != 0) {
        blog.likes -= 1;
        user.likedBlogs.remove(blog);
      }
    } else {
      blog.likes += 1;

      user.likedBlogs.add(blog);
    }
    notifyListeners();
  }

  bool checkIfBlogIsLiked(Blog blog, User user) {
    if (user.likedBlogs.contains(blog)) {
      return true;
    }
    return false;
  }

  List<Blog> getAuthorBlogList(String author) {
    return blogs.where((blog) => blog.author == author).toList();
  }

  void deleteBlog(Blog blog, String author) {
    if (blog.author == author) {
      blogs.remove(blog);
      notifyListeners();
    }
  }
}
