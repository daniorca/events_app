import 'package:code_challenge/src/models/event_model.dart' as EventsModel;
import 'package:code_challenge/src/providers/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNumber = 0;
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  EventsProvider _eventsProvider;

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    _eventsProvider.dispose();
  }

  Future<void> getEvents() async {
    _eventsProvider = Provider.of<EventsProvider>(context, listen: false)
      ..getEvents(pageNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events',
          style: Theme.of(context).textTheme.title,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Container(
        width: _deviceSize.width,
        height: _deviceSize.height,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            _buildSearchField(context),
            SizedBox(height: _deviceSize.height * .02),
            Container(
              width: _deviceSize.width * .9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(),
                  FlatButton(
                    child: Text('See All',
                        style: Theme.of(context)
                            .textTheme
                            .display3
                            .copyWith(color: Colors.grey[400])),
                    onPressed: () {
                      pageNumber = 0;
                      _searchController.clear();
                      _eventsProvider.getEvents(pageNumber.toString());
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: _deviceSize.height * .01),
            _buildEventsList(_deviceSize),
          ],
        ),
      ),
    );
  }

  Expanded _buildEventsList(Size deviceSize) {
    return Expanded(
      child: Consumer<EventsProvider>(
        builder: (_, eventsProvider, __) =>
            NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: eventsProvider.events.length,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index >= eventsProvider.events.length - 1) {
                return Center(child: CircularProgressIndicator());
              } else {
                final eventItem = eventsProvider.events[index];
                return _buildEventItem(eventItem, deviceSize);
              }
            },
          ),
        ),
      ),
    );
  }

  Container _buildSearchField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _searchController,
        autocorrect: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: Material(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).primaryColor,
            child: IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.grey[200],
                size: 20,
              ),
              onPressed: () {
                pageNumber = 0;
                _eventsProvider.getEvents(
                    pageNumber.toString(), _searchController.text);
              },
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search Events',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 20),
          hintStyle: new TextStyle(color: Colors.grey[400]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildEventItem(EventsModel.EventElement event, Size deviceSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * .08, vertical: 20),
          child: Column(
            children: <Widget>[
              Text(DateFormat("dd").format(event.dates.start.localDate),
                  style: Theme.of(context).textTheme.display3.copyWith(
                      color: Colors.red[700], fontWeight: FontWeight.bold)),
              Text(DateFormat("MMM").format(event.dates.start.localDate),
                  style: Theme.of(context)
                      .textTheme
                      .display4
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(DateFormat("yyyy").format(event.dates.start.localDate),
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.grey)),
              Container(
                  margin: EdgeInsets.only(top: 3),
                  color: Colors.grey[400],
                  height: deviceSize.height * .11,
                  width: 0.5)
            ],
          ),
        ),
        Container(
          height: deviceSize.height * .20,
          width: deviceSize.width * .6,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              child: Text(event.name),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(event.images
                              .where((img) =>
                                  img.ratio == EventsModel.Ratio.THE_43)
                              .first
                              ?.url ??
                          null)
                      .image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      pageNumber++;
      _eventsProvider.getEvents(pageNumber.toString());
    }

    return false;
  }
}
