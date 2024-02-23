import 'package:flutter/material.dart';
import 'package:maazoon/models/top_rated_model.dart';
import 'package:maazoon/screens/home_page/home_body_parts/top_rated_item.dart';
import 'package:maazoon/screens/search/search_screens/search_screen_bar.dart';
import 'package:maazoon/shared/constants.dart';

class MenuSearch extends StatelessWidget {
   MenuSearch({Key? key}) : super(key: key);

  List topRatedSheikhs = [
    const TopRatedModel(
      profilePic: 'assets/images/sheikh 1.png',
      name: 'الشيخ - ابراهيم محمد احمد هاني خالد',
      rate: 4.9,
      distance: 20,
    ),
    const TopRatedModel(
      profilePic: 'assets/images/sheikh 2.png',
      name: 'الشيخ - احمد',
      rate: 3,
      distance: 50,
    ),
    const TopRatedModel(
      profilePic: 'assets/images/sheikh 3.png',
      name: 'الشيخ - خالد',
      rate: 4,
      distance: 32.5,
    ),const TopRatedModel(
      profilePic: 'assets/images/sheikh 3.png',
      name: 'الشيخ - خالد',
      rate: 4,
      distance: 32.5,
    ),const TopRatedModel(
      profilePic: 'assets/images/sheikh 3.png',
      name: 'الشيخ - خالد',
      rate: 4,
      distance: 32.5,
    ),const TopRatedModel(
      profilePic: 'assets/images/sheikh 3.png',
      name: 'الشيخ - خالد',
      rate: 4,
      distance: 32.5,
    ),const TopRatedModel(
      profilePic: 'assets/images/sheikh 3.png',
      name: 'الشيخ - خالد',
      rate: 4,
      distance: 32.5,
    ),const TopRatedModel(
      profilePic: 'assets/images/sheikh 3.png',
      name: 'الشيخ - خالد',
      rate: 4,
      distance: 32.5,
    ),const TopRatedModel(
      profilePic: 'assets/images/sheikh 3.png',
      name: 'الشيخ - خالد',
      rate: 4,
      distance: 32.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchScreenBar(),
        SizedBox(height: screenHeight(context)/40,),
        ListView.separated(

            itemBuilder: (ctx, index) =>
                BuildTopRated(model: topRatedSheikhs[index]),
            separatorBuilder: (ctx, index) => SizedBox(
              height: screenHeight(context) / 78,
            ),
            shrinkWrap: true,
            itemCount: topRatedSheikhs.length,
            physics: const BouncingScrollPhysics()),

      ],
    );
  }
}
