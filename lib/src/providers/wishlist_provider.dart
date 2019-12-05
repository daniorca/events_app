import 'package:code_challenge/src/providers/event_item_provider.dart';
import 'package:flutter/material.dart';

class WishListProvider with ChangeNotifier{
  List<EventItem> _wishList = [];
  List<EventItem> get wishList => [...this._wishList];
  bool _startIconBigger = true;

  int get itemCount => this._wishList.length;
  bool get startIconBigger => this._startIconBigger;

  void addToWishList(EventItem eventItem) {
    this._wishList.add(eventItem);
    animateIcon();
  }

  void removeFromWishList(String eventItemId) {
    this._wishList.removeWhere((eventItem) => eventItem.event.id == eventItemId);
    animateIcon();  
  }

  void animateIcon() async{
     _startIconBigger = false;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
     _startIconBigger = true;
    notifyListeners();
  }

}