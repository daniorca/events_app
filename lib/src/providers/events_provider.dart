import 'package:code_challenge/src/models/event_model.dart';
import 'package:code_challenge/src/repository/events_repository.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier{
  final _eventsRepository = EventsRepository();

  List<EventElement> _events = [];
  List<EventElement> get events => [...this._events];

  Future<void> getEvents(String pageNumber, [String searchBy = '']) async {
    if (pageNumber == '0') {
      this._events = [];
    } 
    final records = await _eventsRepository.getEvents(pageNumber, searchBy);
    this._events.addAll(records.embedded.events);
    notifyListeners();
  } 
}