import 'package:code_challenge/src/providers/event_item_provider.dart';
import 'package:code_challenge/src/repository/events_repository.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier{
  final _eventsRepository = EventsRepository();

  List<EventItem> _events = [];
  List<EventItem> get events => [...this._events];

  List<EventItem> get favoriteEvents => [...this._events.where((e) => e.isFavorite)];

  EventItem _selectedEvent;
  EventItem get selectedEvent => this._selectedEvent;
  set selectedEvent(EventItem value) {
    this._selectedEvent = value;
  }

  Future<void> getEvents(String pageNumber, [String searchBy = '']) async {
    if (pageNumber == '0') {
      this._events = [];
    } 
    final records = await _eventsRepository.getEvents(pageNumber, searchBy);
    this._events.addAll(records.embedded.events.map((e) => EventItem(event: e)).toList());
    notifyListeners();
  }
}