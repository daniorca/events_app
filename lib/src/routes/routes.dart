import 'package:code_challenge/src/ui/screens/event_details.dart';
import 'package:code_challenge/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

const String kHomeScreenRoute         = '/home';
const String kEventDetailsScreenRoute = '/event_details';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    kHomeScreenRoute             : (_) => HomeScreen(),
    kEventDetailsScreenRoute     : (_) => EventDetailsScreen()
  };
}