import 'package:flutter/material.dart';
import 'package:maazoon/models/top_rated_model.dart';
import 'package:maazoon/screens/sheikh_details/sheikh_details.dart';
import 'package:maazoon/shared/constants.dart';

class BuildSuggestedItem extends StatelessWidget {
  const BuildSuggestedItem({Key? key, required this.model}) : super(key: key);

  final TopRatedModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => SheikhDetailsScreen(model: model,)));
      },
      child: Container(
        width: screenWidth(context) / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth(context) / 3,
              height: screenHeight(context) * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                model.profilePic,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                model.name,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: screenWidth(context) / 22,
                  color: AppColors.darkGrey,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.star,
                      ),
                      Text(
                        model.rate.toStringAsFixed(1),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
