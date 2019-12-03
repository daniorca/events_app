import 'package:code_challenge/src/providers/event_item_provider.dart';
import 'package:code_challenge/src/providers/events_provider.dart';
import 'package:provider/provider.dart';

class SetupProvider {
  static List<SingleChildCloneableWidget> kProviders = [
    ...kDependentServices,
  ];

  static List<SingleChildCloneableWidget> kDependentServices = [
    ChangeNotifierProvider<EventsProvider>(create: (_) => EventsProvider()),
    ChangeNotifierProvider<EventItem>(create: (_) => EventItem.empty()),
  ];
}