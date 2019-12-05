import 'package:code_challenge/src/providers/wishlist_provider.dart';
import 'package:code_challenge/src/routes/routes.dart';
import 'package:code_challenge/src/ui/components/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
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
          child: Consumer<WishListProvider>(
            builder: (_, eventItemProvier, __) => IconButton(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: eventItemProvier.startIconBigger ? 30 : 16,
                child: Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed(kWishlistScreenRoute),
            ),
          ),
        ));
  }
}
