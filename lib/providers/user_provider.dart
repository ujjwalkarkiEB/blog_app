import '../models/user.dart';

class UserProvider {
  User userInfo = User(
      email: 'ujwal@gmail.com',
      name: 'ujjwal',
      password: '123456789',
      profileImg: "assets/images/add/user_image.png",
      authenticatedState: true,
      registered: true);

  void setUser(User user) {
    userInfo = user;
  }

  // can add functions to change username/img with notifiers
}
