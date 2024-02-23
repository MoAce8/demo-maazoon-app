import 'package:flutter/material.dart';
import 'package:maazoon/models/notification_model.dart';
import 'package:maazoon/screens/notification/notification_card.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  TimeOfDay nowTime = TimeOfDay.now();

  List notifications = [
    NotificationModel(
      profilePic: 'assets/images/sheikh 1.png',
      title: 'تم رفض الطلب',
      description: 'تم رفض طلبكم من الشيخ أبو على',
      time: TimeOfDay.now(),
    ),
    NotificationModel(
      profilePic: 'assets/images/sheikh 1.png',
      title: 'تم رفض الطلب',
      description: 'تم رفض طلبكم من الشيخ أبو على',
      time: TimeOfDay.now(),
    ),
    NotificationModel(
      profilePic: 'assets/images/sheikh 2.png',
      title: 'تم ارجاع مبلغ الحجز',
      description: 'تم ارجاع ملبلغ الحجز يمكنكم الان حجز مأذون جديد',
      time: TimeOfDay.now(),
    ),
    NotificationModel(
      profilePic: 'assets/images/sheikh 3.png',
      title: 'تم تنفيذ الطلب',
      description: 'تهانينا بالزواج السعيد يمكنكم الان تقييم التجربة',
      time: TimeOfDay.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      context: context,
      title: const Text('الإشعارات'),
      scrollable: false,
      body: ListView.separated(

        shrinkWrap: true,
          itemBuilder: (ctx, index) =>
              NotificationCard(model: notifications[index]),
          separatorBuilder: (ctx,index)=>SizedBox(height: screenHeight(context) * 0.013),
          itemCount: notifications.length),
    );
  }
}
