import 'package:code_challenge/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

const String kHomeScreenRoute       = '/home';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    kHomeScreenRoute             : (_) => HomeScreen(),
  };
}