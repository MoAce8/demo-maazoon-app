import 'package:flutter/material.dart';
import 'package:maazoon/screens/home_page/tabs_screen.dart';
import 'package:maazoon/screens/login_screen/login_screen.dart';

class SplashImage extends StatefulWidget {
  const SplashImage({Key? key}) : super(key: key);

  @override
  State<SplashImage> createState() => _SplashImageState();
}

class _SplashImageState extends State<SplashImage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const TabsScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/splash.png'),
    );
  }
}
