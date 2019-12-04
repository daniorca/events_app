import 'package:code_challenge/src/models/event_model.dart';
import 'package:flutter/material.dart';

class EventItem with ChangeNotifier{

  EventElement event;
  bool isFavorite = false;

  EventItem({
    @required this.event,
    this.isFavorite = false
  });

  EventItem.empty();

  void toggleIsFavorite() {
    this.isFavorite = !this.isFavorite;
    notifyListeners();
  }
}