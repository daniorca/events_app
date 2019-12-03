import 'package:code_challenge/src/providers/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: <Widget>[
            Text('Events', style: Theme.of(context).textTheme.title),
            Spacer(),
            Stack(
              children: <Widget>[
                IconButton(icon: Icon(Icons.star), onPressed: () {}),
                Container(
                  child: Center(
                    child: Consumer<EventsProvider>(
                      builder: (_, eventsProvider, __) => Text(
                        eventsProvider.favoriteEvents.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0)),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                  width: 50.0,
                  height: 50.0,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
