import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_challenge/src/ui/components/progress_indicator.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
            width: 50.0,
            height: 50.0,
            child: CachedNetworkImage(
              imageUrl: 'https://i.pravatar.cc/300',
              fit: BoxFit.cover,
              placeholder: (context, url) => MyProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
      ),
    );
  }
}