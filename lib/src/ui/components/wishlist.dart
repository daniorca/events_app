import 'package:code_challenge/src/providers/wishlist_provider.dart';
import 'package:code_challenge/src/routes/routes.dart';
import 'package:code_challenge/src/ui/components/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    animation = Tween<double>(begin: 24, end: 16).animate(animationController);
      // ..addListener(() {
      //   setState(() {});
      // });
    
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WishListProvider>(
      builder: (_, wishListProvider, ch) {
        return Badge(
        child: ch,
        value: wishListProvider.itemCount.toString(),
      );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: IconButton(
            icon: Icon(
              Icons.star,
              size: animation.value,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => Navigator.of(context).pushNamed(kWishlistScreenRoute),
          ),
      ), 
    );
  }
}
