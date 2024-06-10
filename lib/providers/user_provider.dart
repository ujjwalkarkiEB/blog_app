import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> userData = {
    'userName': 'anonymous',
    'image': 'assets/images/add/user_image.png'
  };

  void setUserData(Map<String, dynamic> data) {
    userData = data;
    print('userdara: $userData');
    notifyListeners();
  }

  void setNameOnly(String name) {
    userData['userName'] = name;
    notifyListeners();
  }

  void setProfileImageOnly(String name) {
    userData['image'] = name;
    notifyListeners();
  }
}
