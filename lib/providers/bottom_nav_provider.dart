import 'package:flutter/material.dart';
import 'package:hitch_hiker_app/screens/create_event_screen.dart';
import 'package:hitch_hiker_app/screens/home_screen.dart';
import 'package:hitch_hiker_app/screens/tent_story_screen.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 1;

  Widget _currentPage = const HomeScreen();

  int get currentIndex => _currentIndex;

  Widget get currentPage => _currentPage;

  void setCurrentIndex(int index) {
    _currentIndex = index;

    switch (index) {
      case 0:
        _currentPage = const CreateEventScreen();
        break;
      case 1:
        _currentPage = const HomeScreen();
        break;
      case 2:
        _currentPage = const TentStoryScreen();
        break;
      default:
        _currentPage = const HomeScreen();
    }
    notifyListeners();
  }
}
