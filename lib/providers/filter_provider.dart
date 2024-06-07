import 'package:blog_app/models/blog.dart';
import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  List<BlogCategory> activefilters = [];

  void setFilters(List<BlogCategory> filter) {
    activefilters = filter;
    notifyListeners();
  }

  void resetFilter() {
    activefilters.clear();
  }
}
