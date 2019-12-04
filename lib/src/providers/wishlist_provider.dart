import 'package:code_challenge/src/providers/event_item_provider.dart';
import 'package:flutter/material.dart';

class WishListProvider with ChangeNotifier{
  List<EventItem> _wishList = [];
  List<EventItem> get wishList => [...this._wishList];

  int get itemCount => this._wishList.length;

  void addToWishList(EventItem eventItem) {
    this._wishList.add(eventItem);
    notifyListeners();
  }

  void removeFromWishList(String eventItemId) {
    this._wishList.removeWhere((eventItem) => eventItem.event.id == eventItemId);
    notifyListeners();
  }
}