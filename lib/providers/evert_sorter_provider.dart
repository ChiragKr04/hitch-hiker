import 'package:flutter/material.dart';
import 'package:hitch_hiker_app/widgets/builders/latest_event_builder.dart';
import 'package:hitch_hiker_app/widgets/builders/nearest_event_builder.dart';
import 'package:hitch_hiker_app/widgets/builders/soon_event_builder.dart';

class EventSorterProvider extends ChangeNotifier {
  int _eventSorter = 0;
  Widget _currentPage = const LatestEventBuilder();

  int get eventSorter => _eventSorter;
  Widget get currentPage => _currentPage;

  set eventSorter(int value) {
    _eventSorter = value;
    if (value == 0) {
      _currentPage = const LatestEventBuilder();
    } else if (value == 1) {
      _currentPage = const SoonEventBuilder();
    } else if (value == 2) {
      _currentPage = const NearestEventBuilder();
    }
    notifyListeners();
  }
}
