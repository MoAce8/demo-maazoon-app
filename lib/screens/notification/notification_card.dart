import 'package:flutter/material.dart';
import 'package:maazoon/models/notification_model.dart';
import 'package:maazoon/shared/constants.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key, required this.model}) : super(key: key);

  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.notificationBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الإشعارات',
            softWrap: true,
            style: TextStyle(
              fontSize: screenWidth(context) / 18.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight(context) * 0.02),
          Row(
            children: [
              Container(
                width: screenWidth(context)/11,
                height: screenWidth(context)/11,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: AssetImage(model.profilePic),fit: BoxFit.cover,)
                ),
              ),
              SizedBox(
                width: screenWidth(context) * 0.05,
              ),
              Text(
                model.title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: screenWidth(context) / 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight(context) * 0.013),
          Row(
            children: [
              Container(
                width: screenWidth(context) * 0.011,
                height: screenHeight(context) * 0.04,
                decoration: BoxDecoration(
                    color: AppColors.grey22,
                    borderRadius: BorderRadius.circular(16)),
              ),
              SizedBox(
                width: screenWidth(context) * 0.028,
              ),
              SizedBox(
                width: screenWidth(context)/1.5,
                child: Text(
                  model.description,
                  softWrap: true,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: screenWidth(context) / 22,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight(context) * 0.013),
          Row(
            children: [
              Text(
                'اليوم الساعة ${model.time.format(context)}',
                style: TextStyle(
                  fontSize: screenWidth(context) / 25.5,
                  color: AppColors.grey22,
                ),
              ),
              const Spacer(),
              GestureDetector(
                child: Text(
                  'التفاصيل',
                  style: TextStyle(
                    fontSize: screenWidth(context) / 25.5,
                    color: AppColors.blue,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
