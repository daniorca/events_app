import 'package:code_challenge/src/constants/app_constants.dart';
import 'package:code_challenge/src/providers/events_provider.dart';
import 'package:code_challenge/src/ui/components/image_profile.dart';
import 'package:code_challenge/src/ui/components/progress_indicator.dart';
import 'package:code_challenge/src/ui/components/wishlist.dart';
import 'package:code_challenge/src/ui/screens/event_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int pageNumber = 0;
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  EventsProvider _eventsProvider;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      try {
        _eventsProvider = Provider.of<EventsProvider>(context, listen: false)
          ..getEvents(pageNumber.toString());
      } catch (e) {
        showSnackBar(kGenericErrorMessage);
      }
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Events',
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Wishlist(),
          ),
          ImageProfile(),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: _deviceSize.width,
          height: _deviceSize.height,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: <Widget>[
              SizedBox(height: _deviceSize.height * .025),
              _buildSearchField(context),
              SizedBox(height: _deviceSize.height * .02),
              _buildSeeAll(_deviceSize, context),
              SizedBox(height: _deviceSize.height * .01),
              _buildEventsList(_deviceSize),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSeeAll(Size _deviceSize, BuildContext context) {
    return Container(
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
                    .copyWith(color: Colors.grey[500])),
            onPressed: () {
              pageNumber = 0;
              _searchController.clear();
              try {
                _eventsProvider.getEvents(pageNumber.toString());
              } catch (e) {
                showSnackBar(kGenericErrorMessage);
              }
            },
          )
        ],
      ),
    );
  }

  Expanded _buildEventsList(Size deviceSize) {
    return Expanded(
      child: Consumer<EventsProvider>(
        builder: (_, eventsProvider, __) => eventsProvider.events.isEmpty
            ? MyProgressIndicator()
            : NotificationListener<ScrollNotification>(
                onNotification: _handleScrollNotification,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: eventsProvider.events.length,
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= eventsProvider.events.length - 1) {
                      return MyProgressIndicator();
                    } else {
                      return ChangeNotifierProvider.value(
                        value: eventsProvider.events[index],
                        child: EventItemWidget(),
                      );
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
                try {
                  _eventsProvider.getEvents(
                      pageNumber.toString(), _searchController.text);
                } catch (e) {
                  showSnackBar(kGenericErrorMessage);
                }
                _scrollToTop();
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

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      pageNumber++;
      try {
        _eventsProvider.getEvents(
            pageNumber.toString(), _searchController.text);
      } catch (e) {
        showSnackBar(kGenericErrorMessage);
      }
    }

    return false;
  }

  void _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  void showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content:
          Text(message, style: TextStyle(fontSize: 16, color: Colors.white)),
      backgroundColor: Theme.of(context).errorColor,
      duration: Duration(seconds: 2),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    _eventsProvider.dispose();
  }
}
