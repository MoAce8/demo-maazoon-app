import 'package:flutter/material.dart';
import 'package:maazoon/screens/splash_screen/splash2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            setState(
              () {
                _visible = false;
              },
            );
            Future.delayed(const Duration(milliseconds: 600), () {
              if (_visible == false) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (ctx) => const SplashImage()),
                );
              }
            });
          }
        },
      );

    _sizeAnimation = Tween(
      begin: 50.0,
      end: 1000.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: AnimatedBuilder(
        animation: _sizeAnimation,
        builder: (context, child) => Center(
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              'assets/images/logo.png',
              height: _sizeAnimation.value,
              width: _sizeAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}
