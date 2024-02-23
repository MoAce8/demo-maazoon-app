import 'package:flutter/material.dart';
import 'package:maazoon/screens/home_page/home_body.dart';
import 'package:maazoon/shared/constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeBody(),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenHeight(context)* 0.15,
            horizontal: screenWidth(context)* 0.06,
          ),
          child: Image.asset(
            'assets/images/home frame.png',
          ),
        ),
      ],
    );
  }
}
