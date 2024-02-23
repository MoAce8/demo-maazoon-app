import 'package:flutter/material.dart';
import 'package:maazoon/models/top_rated_model.dart';
import 'package:maazoon/screens/sheikh_details/sheikh_details.dart';
import 'package:maazoon/shared/constants.dart';

class BuildTopRated extends StatelessWidget {
  const BuildTopRated({Key? key, required this.model}) : super(key: key);

  final TopRatedModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => SheikhDetailsScreen(model: model,)));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey2),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              offset: Offset(0, 5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: screenWidth(context) * 0.2,
              height: screenHeight(context) * 0.07,
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
              width: screenWidth(context) / 22,
            ),
            Text(
              smallSentence(model.name),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: screenWidth(context) / 22,
                color: AppColors.darkGrey,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.star,
                    ),
                    Text(
                      model.rate.toStringAsFixed(1),
                      style: TextStyle(
                          fontSize: screenWidth(context) / 25.5,
                          color: AppColors.darkGrey),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.route,
                      color: AppColors.black,
                    ),
                    Text(
                      '${model.distance.toStringAsFixed(1)} كم',
                      style: TextStyle(
                          fontSize: screenWidth(context) / 25.5,
                          color: AppColors.darkGrey),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
