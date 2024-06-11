import 'package:blog_app/models/user.dart';

class AuthenticationProvider {
  final List<User> registeredUsers = [
    User(
        email: 'ujwal@gmail.com',
        password: '123456789',
        profileImg: "assets/images/add/user_image.png",
        authenticatedState: true,
        registered: true,
        name: 'ujjwal karki'),
    User(
        email: 'ujwal1@gmail.com',
        password: '123456789',
        profileImg: "assets/images/add/user_image.png",
        name: 'ujjwal kkarki',
        authenticatedState: true,
        registered: true)
  ];
  String registerUser(User user) {
    for (var u in registeredUsers) {
      if (user.name == u.name) {
        return 'The given username has already been taken!';
      }
      if (user.email == u.email) {
        return 'The account has already been created with the given gmail!';
      }
    }
    if (!user.registered) {
      user.register(user.name, user.email, user.password, user.profileImg);
      registeredUsers.add(user);
    }
    return '';
  }

  void setAuthenticatedState(User user, bool state) {
    user.setAuthenticatedState(state);
  }

  User? authenticateUser(String email, String password) {
    for (var user in registeredUsers) {
      if (user.email == email && user.password == password) {
        user.setAuthenticatedState(true);
        return user;
      }
    }
    return null;
  }

  void logoutUser(User user) {
    user.authenticatedState = false;
  }

  void updateUserDetails(User user, {String? email, String? password}) {
    if (email != null) {
      user.email = email;
    }
    if (password != null) {
      user.password = password;
    }
  }
}
