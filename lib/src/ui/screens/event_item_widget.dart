import 'package:code_challenge/src/providers/event_item_provider.dart';
import 'package:code_challenge/src/providers/events_provider.dart';
import 'package:code_challenge/src/routes/routes.dart';
import 'package:code_challenge/src/ui/components/event_date.dart';
import 'package:code_challenge/src/ui/components/small_dot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code_challenge/src/models/event_model.dart' as EventsModel;

class EventItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final eventsProvider = Provider.of<EventsProvider>(context, listen: false);
    final eventItem = Provider.of<EventItem>(context);

    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: deviceSize.width * .05, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildDateInfo(deviceSize, eventItem),
              Spacer(),
              buildCardEventImage(
                  eventItem, deviceSize, context, eventsProvider)
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Text(eventItem.event.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .display3
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
          ),
          buildGenreInfo(eventItem, context),
          SizedBox(height: 15)
        ],
      ),
    );
  }

  Widget buildGenreInfo(EventItem eventItem, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: eventItem.event.classifications
            .map((c) => Row(
                  children: <Widget>[
                    Text(c.segment?.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.grey)),
                    SmallDot(),
                    Text(c.genre?.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.grey)),
                    SmallDot(),
                    Text(c.subGenre?.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.grey))
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget buildDateInfo(Size deviceSize, EventItem eventItem) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: deviceSize.width * .04),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0)),
            child: new EventDate(startDate: eventItem.event.dates.start),
          ),
          Container(
              margin: EdgeInsets.only(top: 3),
              color: Colors.grey[400],
              height: deviceSize.height * .10,
              width: 0.4)
        ],
      ),
    );
  }

  Widget buildCardEventImage(EventItem eventItem, Size deviceSize,
      BuildContext context, EventsProvider eventsProvider) {
    return InkWell(
      child: Hero(
        tag: eventItem.event.id,
        child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: deviceSize.height * .18,
              width: deviceSize.width * .6,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 0.0,
                    child: Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Consumer<EventItem>(
                          builder: (_, eventItemProvider, __) => Icon(
                            eventItemProvider.isFavorite
                                ? Icons.star
                                : Icons.star_border,
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.network(eventItem.event.images
                                  .where((img) =>
                                      img.ratio == EventsModel.Ratio.THE_43)
                                  .first
                                  ?.url ??
                              null)
                          .image,
                      fit: BoxFit.cover)),
            )),
      ),
      onTap: () {
        eventsProvider.selectedEvent = eventItem;
        Navigator.pushNamed(context, kEventDetailsScreenRoute);
      },
    );
  }
}
