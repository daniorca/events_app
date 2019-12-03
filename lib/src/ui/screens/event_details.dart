import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_challenge/src/providers/event_item_provider.dart';
import 'package:code_challenge/src/providers/events_provider.dart';
import 'package:code_challenge/src/ui/components/event_date.dart';
import 'package:code_challenge/src/ui/components/progress_indicator.dart';
import 'package:code_challenge/src/ui/components/small_dot.dart';
import 'package:flutter/material.dart';
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
      body: ChangeNotifierProvider<EventItem>.value(
          value: selectedEvent,
          child: Container(
            width: _deviceSize.width,
            height: _deviceSize.height,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildEventCardImage(_deviceSize, selectedEvent),
                SizedBox(height: 20),
                Card(
                  elevation: 0,
                  child: Container(
                    margin: EdgeInsets.all(4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        EventDate(startDate: selectedEvent.event.dates.start),
                        SizedBox(width: 5),
                        Container(
                            margin: EdgeInsets.only(top: 3),
                            color: Colors.grey[400],
                            height: _deviceSize.height * .055,
                            width: 0.80),
                        SizedBox(width: 5),
                        Container(
                            height: _deviceSize.height * .058,
                            width: _deviceSize.width * .75,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: _deviceSize.width * .60,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(selectedEvent.event.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .display3
                                              .copyWith(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600)),
                                      Spacer(),
                                      _buildPrices(selectedEvent, context)
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Consumer<EventItem>(
                                  builder: (_, eventItemProvider, __) =>
                                      IconButton(
                                    onPressed: () =>
                                        eventItemProvider.toggleIsFavorite(),
                                    icon: Icon(
                                      eventItemProvider.isFavorite
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Card(
                  elevation: 0,
                  child: Container(
                    margin: EdgeInsets.all(4),
                    height: _deviceSize.height * 0.09,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildVenueImage(selectedEvent),
                        SizedBox(width: 10),
                        Container(
                          width: _deviceSize.width * .58,
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              buildVenue(selectedEvent, context),
                              Spacer(),
                              Row(
                                children: <Widget>[
                                  Text(
                                      selectedEvent.event.embedded?.venues
                                              ?.first?.city?.name ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .copyWith(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600)),
                                  SmallDot(),
                                  Text(
                                      selectedEvent.event.embedded?.venues
                                              ?.first?.state?.name ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .copyWith(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Text(
                                selectedEvent.event.embedded?.venues?.first
                                        ?.country?.name ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  ClipRRect buildVenueImage(EventItem selectedEvent) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: 100,
        height: 80,
        child: selectedEvent.event.embedded.venues.isNotEmpty &&
                selectedEvent.event.embedded.venues.first.images.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: selectedEvent.event.embedded.venues.first.images
                        .where((img) => img.url != null)
                        .first
                        ?.url ??
                    null,
                fit: BoxFit.cover,
                placeholder: (context, url) => MyProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/images/event_dummy.jpg'),
              ),
      ),
    );
  }

  Row buildVenue(EventItem selectedEvent, BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.red[800],
          size: 20,
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(selectedEvent.event.embedded?.venues?.first?.name ?? '',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
        )
      ],
    );
  }

  Row _buildPrices(EventItem selectedEvent, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: selectedEvent.event.priceRanges
          .map((p) => Row(
                children: <Widget>[
                  Text(p.currency,
                      style: Theme.of(context).textTheme.display3.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700)),
                  SmallDot(),
                  Text('Min - ${p.min}',
                      style: Theme.of(context)
                          .textTheme
                          .display2
                          .copyWith(color: Colors.grey)),
                  SmallDot(),
                  Text('Max - ${p.max}',
                      style: Theme.of(context)
                          .textTheme
                          .display2
                          .copyWith(color: Colors.grey)),
                ],
              ))
          .toList(),
    );
  }

  Container _buildEventCardImage(Size _deviceSize, EventItem selectedEvent) {
    return Container(
      width: _deviceSize.width,
      height: _deviceSize.height * .3,
      child: Hero(
        tag: selectedEvent.event.id,
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
              imageUrl: selectedEvent.event.images
                      .where((img) => img.ratio == EventsModel.Ratio.THE_43)
                      .first
                      ?.url ??
                  null,
              fit: BoxFit.cover,
              placeholder: (context, url) => MyProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
      ),
    );
  }
}
