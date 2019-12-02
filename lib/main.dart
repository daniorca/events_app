import 'package:code_challenge/src/providers/events_provider.dart';
import 'package:code_challenge/src/routes/routes.dart';
import 'package:code_challenge/src/themes/theme_data.dart';
import 'package:code_challenge/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EventsProvider>(
      create: (context) => EventsProvider(),
      child: MaterialApp(
        title: 'Events',
        theme: kEventsTheme,
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(),
      ),
    );
  }
}
