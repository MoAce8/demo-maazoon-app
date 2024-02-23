import 'package:flutter/material.dart';
import 'package:maazoon/shared/constants.dart';

class ReservsScreen extends StatelessWidget {
  const ReservsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navBar,
        title: const Text('حجوزاتي'),
      ),
      body: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) / 22,
            vertical: screenHeight(context) / 28),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context) / 22,
              vertical: screenHeight(context) / 28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.lightOlive,
          ),
          height: screenHeight(context) / 4,
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                'assets/images/Calendar.png',
              ),
              SizedBox(
                height: screenHeight(context) / 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/alert.png',
                  ),
                  SizedBox(
                    width: screenWidth(context) / 1.5,
                    child: Text(
                      'لا يوجد حجوزات يرجى الذهاب للشاشة الرئيسية وتحديد حجز',
                      style: TextStyle(
                        fontSize: screenWidth(context) / 25.5,
                        color: AppColors.redError,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
