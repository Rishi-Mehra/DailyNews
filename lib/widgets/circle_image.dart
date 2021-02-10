import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  String urlToImage;

  CircleImage({this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:  urlToImage,
      imageBuilder: (context, imageProviders) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: imageProviders,
                  fit: BoxFit.cover
              ),
          ),

        );
      },
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return Container();
      },
    );

  }
}
