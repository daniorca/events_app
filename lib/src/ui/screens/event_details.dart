import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_challenge/src/providers/events_provider.dart';
import 'package:code_challenge/src/ui/components/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:code_challenge/src/models/event_model.dart' as EventsModel;

class EventDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    final _eventsProvider = Provider.of<EventsProvider>(context, listen: false);
    final selectedEvent = _eventsProvider.selectedEvent;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        width: _deviceSize.width,
        height: _deviceSize.height,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: _deviceSize.width,
              height: _deviceSize.height * .3,
              child: Hero(
                tag: selectedEvent.event.id,
                child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: selectedEvent.event.images
                              .where((img) =>
                                  img.ratio == EventsModel.Ratio.THE_43)
                              .first
                              ?.url ??
                          null,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => MyProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
              ),
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                        DateFormat("dd")
                            .format(selectedEvent.event.dates.start.localDate),
                        style: Theme.of(context).textTheme.display3.copyWith(
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold)),
                    Text(
                        DateFormat("MMM")
                            .format(selectedEvent.event.dates.start.localDate),
                        style: Theme.of(context)
                            .textTheme
                            .display4
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text(
                        DateFormat("yyyy")
                            .format(selectedEvent.event.dates.start.localDate),
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.grey)),
                  ],
                ),
                SizedBox(width: 15),
                Container(
                    margin: EdgeInsets.only(top: 3),
                    color: Colors.grey[400],
                    height: _deviceSize.height * .055,
                    width: 0.80),
                SizedBox(width: 15),
                Container(
                  height: _deviceSize.height * .058,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(selectedEvent.event.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.display3.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w600)),
                      Spacer(),
                      Icon(Icons.location_on, color: Colors.red[800], size: 18,)
                    ],
                  ),
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
