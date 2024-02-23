import 'package:flutter/material.dart';
import 'package:maazoon/shared/constants.dart';

class BuildWeddingCard extends StatelessWidget {
  const BuildWeddingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: screenHeight(context) / 9.8,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/wedding.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16),
          ),

        ),
        Text(
          'إعلان قاعة أفراح',
          style: TextStyle(
            color: AppColors.white,
            fontSize: screenWidth(context)/15.5,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
