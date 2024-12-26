import 'package:flutter/material.dart';

import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  static const double _iconSize = 50;

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );
    _animation = CurvedAnimation(
        parent: _animationController.view, curve: Curves.easeInCubic);

    _animationController.forward().whenComplete(() => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(
              ((MediaQuery.of(context).size.width / _iconSize - 1) * _animationController.value),
              (MediaQuery.of(context).size.height / _iconSize - 1) -
                  ((MediaQuery.of(context).size.height / _iconSize - 1) * _animationController.value)),
          child: child,
        );
      },
      child: Image.asset(
        'assets/images/rocket_minimal_new.png',
        width: _iconSize,
        height: _iconSize,
      ),
    ));
  }
}
