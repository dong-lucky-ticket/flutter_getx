import 'package:flutter/material.dart';

class CustomImageContainerWidget extends Container {
  final String urlImage;

  CustomImageContainerWidget({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 350,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(urlImage),
        )),
      ),
    );
  }
}
