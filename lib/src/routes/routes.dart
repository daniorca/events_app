import 'package:code_challenge/src/ui/screens/event_details_screen.dart';
import 'package:code_challenge/src/ui/screens/home_screen.dart';
import 'package:code_challenge/src/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';

const String kHomeScreenRoute         = '/home';
const String kEventDetailsScreenRoute = '/event_details';
const String kWishlistScreenRoute = '/wishlist';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    kHomeScreenRoute             : (_) => HomeScreen(),
    kEventDetailsScreenRoute     : (_) => EventDetailsScreen(),
    kWishlistScreenRoute         : (_) => WishlistScreen()
  };
}