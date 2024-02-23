import 'package:flutter/material.dart';
import 'package:maazoon/shared/constants.dart';

class BuildRecommendCard extends StatelessWidget {
  const BuildRecommendCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.19,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.notificationIcon,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: screenHeight(context) * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/recommend.png',
                ),
              ),
            ),
          ),
          Container(
            height: screenHeight(context) * 0.19,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.lightOlive.withOpacity(0.2),
                    AppColors.lightOlive,
                  ],
                )),
          ),
          SizedBox(
            height: screenHeight(context) * 0.095,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'لا تعرف من اين تبدأ؟',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(context) / 19,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      'الأمر بسيط معنا!',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(context) / 19,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
                GestureDetector(

                  child: Container(
                    height: screenHeight(context) * 0.07,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColors.search,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'رشح لي مأذون',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: screenWidth(context) / 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
