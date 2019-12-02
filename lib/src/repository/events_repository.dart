import 'package:code_challenge/src/models/event_model.dart';
import 'package:code_challenge/src/services/events_services.dart';

class EventsRepository {
  final _eventsService = EventsService();

  Future<Event> getEvents(String pageNumber, [String searchBy = '']) async {
    try {
      final response = await _eventsService.getEvents(pageNumber, searchBy);
      return eventFromJson(response);
    } catch (e) {
      throw e;
    }
  }
}