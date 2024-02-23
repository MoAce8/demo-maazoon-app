import 'package:flutter/material.dart';
import 'package:maazoon/models/top_rated_model.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';

class SheikhDetailsScreen extends StatelessWidget {
  const SheikhDetailsScreen({Key? key, required this.model}) : super(key: key);

  final TopRatedModel model;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      context: context,
      title: const Text('مأذون شرعي'),
      scrollable: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: screenHeight(context) / 4,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              model.profilePic,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: screenHeight(context) / 50,
          ),
          Text(
            firstFewWords(model.name),
            style: TextStyle(
              fontSize: screenWidth(context) / 15.5,
            ),
          ),
          SizedBox(
            height: screenHeight(context) / 50,
          ),
          Text(
            'رقم إعتماد ( )',
            style: TextStyle(
              fontSize: screenWidth(context) / 25.5,
            ),
          ),
          SizedBox(
            height: screenHeight(context) / 50,
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.route,
                    color: AppColors.black,
                  ),
                  Text(
                    '${model.distance.toStringAsFixed(2)} كم',
                    style: TextStyle(
                        fontSize: screenWidth(context) / 25.5,
                        color: AppColors.darkGrey),
                  )
                ],
              ),
              SizedBox(width: screenWidth(context)/40,),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.star,
                  ),
                  Text(
                    model.rate.toStringAsFixed(2),
                    style: TextStyle(
                        fontSize: screenWidth(context) / 25.5,
                        color: AppColors.darkGrey),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: screenHeight(context) / 50,
          ),
          Text(
            'السلام عليكم، أنا الشيخ أبو على، أعمل في مجال الدعوة والإرشاد منذ عدة سنوات وخبرة بعقود النكاح، وأهتم بتطوير الذات وتحسين العلاقات الاجتماعية والأسرية. أتمنى أن تستفيدوا من خبرتي ونتشارك الفائدة عبر هذا التطبيق الرائع.',
            style: TextStyle(
              fontSize: screenWidth(context) / 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          AppElevatedButton(
            context: context,
            onPressed: () {},
            title: 'حجز المأذون',
          )
        ],
      ),
    );
  }
}
