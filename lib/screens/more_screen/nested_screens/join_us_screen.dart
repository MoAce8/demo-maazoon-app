import 'package:flutter/material.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';

class JoinUsScreen extends StatelessWidget {
  const JoinUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      appBar: AppBar(
        title: const Text('انضم الينا'),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: AppColors.white),
        child: Column(
          children: [
            Container(
                height: screenHeight(context) * 0.45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/join us pic.png',
                  fit: BoxFit.cover,
                )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'يمكنك الإنضمام الى قائمة المأذونين الآن!',
                      style: TextStyle(
                        fontSize: screenWidth(context) / 18.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.oliveAccent,
                      ),
                    ),
                    Text(
                      'حمل تطبيق المأذونين الآن لتبدأ استقبال الطلبات',
                      style: TextStyle(
                          fontSize: screenWidth(context) / 22,
                          color: AppColors.primaryGreen),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.05,
                    ),
                    AppElevatedButton(
                        context: context,
                        onPressed: () {},
                        title: 'تحميل التطبيق'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
