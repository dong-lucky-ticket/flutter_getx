import 'package:flutter/material.dart';

class CustomIconWidget extends Container {
  final String url;

  CustomIconWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            
            //abrir navegadores links
            onTap: () => debugPrint('clico'),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(url)))),
          )
        ],
      ),
    );
  }
}
