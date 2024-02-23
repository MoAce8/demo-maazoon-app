import 'package:flutter/material.dart';
import 'package:maazoon/shared/constants.dart';

class BuildMoreCard extends StatelessWidget {
  const BuildMoreCard({Key? key, required this.pic, required this.name, required this.onTap})
      : super(key: key);
  final Function() onTap;
  final String pic;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight(context) / 78),
        child: Row(
          children: [
            Image.asset('assets/images/$pic.png'),
            SizedBox(
              width: screenWidth(context) / 60,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: screenWidth(context) / 22,
                fontWeight: FontWeight.bold,
                color: AppColors.grey22,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
