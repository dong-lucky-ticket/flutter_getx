import 'package:flutter/material.dart';

class CustomDrawerHeaderWidget extends StatelessWidget {
  const CustomDrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Row(children: [
        CircleAvatar(
          radius: 32, // 设置头像的半径为11
          child: Image.asset(
            'assets/images/avatar_girl.png',
          ),
        ),
        const SizedBox(width: 16),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('自律的小码农',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Text('攒钱的小码农',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        )
      ]),
    );
  }
}
