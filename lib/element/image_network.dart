import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final bool isBox;
  final String urlImg;
  const ImageNetwork({super.key, required this.isBox, required this.urlImg});

  @override
  Widget build(BuildContext context) {
    if(isBox) {
      return Image.network(
      urlImg,
      fit: BoxFit.fill,
    );
    }
    return Image.network(
      urlImg
    );
  }
}