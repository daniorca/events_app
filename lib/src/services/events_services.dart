import 'dart:io';

import 'package:code_challenge/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class EventsService {
  static const Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  Future<String> getEvents(String pageNumber, [String searchBy = '']) async {
    try {
      final response = await http.get(
        Uri.encodeFull(
            '${kRootUrl}events.json?apikey=$kConsumerAPIKey&page=$pageNumber&keyword=$searchBy'),
        headers: _headers,
      );
      return response.body;
    } catch (e) {
      print(e.message);
      return null;
    }
  }
}
