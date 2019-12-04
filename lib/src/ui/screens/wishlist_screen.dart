import 'package:code_challenge/src/providers/wishlist_provider.dart';
import 'package:code_challenge/src/ui/screens/event_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
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
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
              _buildWishlist(_deviceSize, context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildWishlist(Size deviceSize, BuildContext context) {
    final wishlistProvider = Provider.of<WishListProvider>(context);
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: wishlistProvider.wishList.length,
        itemBuilder: (BuildContext context, int index) =>
            ChangeNotifierProvider.value(
          value: wishlistProvider.wishList[index],
          child: EventItemWidget(),
        ),
      ),
    );
  }
}
