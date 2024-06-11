// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

import 'blog.dart';

var uuid = const Uuid();

class User {
  final String id;
  String name;
  String email;
  String password;
  bool authenticatedState;
  bool registered;
  String profileImg;
  final List<Blog> createdBlogs = [];
  final List<Blog> likedBlogs = [];
  User({
    this.name = 'anonymous',
    required this.email,
    required this.password,
    this.authenticatedState = false,
    this.registered = false,
    this.profileImg = "assets/images/add/user_image.png",
  }) : id = uuid.v4();

  void setAuthenticatedState(bool state) {
    authenticatedState = state;
  }

  // Method to register the user
  void register(String name, String email, String password, String profileImg) {
    this.name = name;
    this.email = email;
    this.password = password;
    this.profileImg = profileImg;
    registered = true;
  }

  // Method to update user details
  void updateUserDetails({
    String? name,
    String? email,
    String? password,
    String? profileImg,
  }) {
    if (name != null) {
      this.name = name;
    }
    if (email != null) {
      this.email = email;
    }
    if (password != null) {
      this.password = password;
    }
    if (profileImg != null) {
      this.profileImg = profileImg;
    }
  }

  // Method to add a blog to the liked blogs list
  void likeBlog(Blog blog) {
    likedBlogs.add(blog);
  }

  // Method to remove a blog from the liked blogs list
  void unlikeBlog(Blog blog) {
    likedBlogs.remove(blog);
  }

  // Method to check login credentials
  bool checkLoginCredentials(String email, String password) {
    if (this.email == email && this.password == password) {
      setAuthenticatedState(true);
      return true;
    } else {
      setAuthenticatedState(false);
      return false;
    }
  }
}
