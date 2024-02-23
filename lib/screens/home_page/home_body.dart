import 'package:flutter/material.dart';
import 'package:maazoon/models/top_rated_model.dart';
import 'package:maazoon/screens/home_page/home_body_parts/recommend_card.dart';
import 'package:maazoon/screens/home_page/home_body_parts/search_bar.dart';
import 'package:maazoon/screens/home_page/home_body_parts/suggested_item.dart';
import 'package:maazoon/screens/home_page/home_body_parts/top_rated_item.dart';
import 'package:maazoon/screens/home_page/home_body_parts/wedding_card.dart';
import 'package:maazoon/screens/login_screen/login_screen.dart';
import 'package:maazoon/screens/notification/notification_screen.dart';
import 'package:maazoon/shared/constants.dart';

// ignore: must_be_immutable
class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);

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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      appBar: AppBar(
        title: Text(
          'مرحبا بك في تطبيق مأذون',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth(context) / 19,
            color: AppColors.lightOlive,
          ),
        ),
        backgroundColor: AppColors.primaryGreen,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.white),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => NotificationsScreen()));
                },
                icon: const Icon(Icons.notifications_outlined),
                color: AppColors.notificationIcon,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: screenHeight(context),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: AppColors.white,
        ),
        margin: EdgeInsets.only(top: screenHeight(context) * 0.12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: screenHeight(context) * 0.14),
          child: Column(
            children: [
              const BuildSearchBar(),
              SizedBox(height: screenHeight(context) / 42),
              const BuildRecommendCard(),
              SizedBox(height: screenHeight(context) / 42),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'أعلى تقييما',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: screenWidth(context) / 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight(context) / 70),
              SizedBox(
                height: screenHeight(context) / 4,
                width: screenWidth(context) / 1.128,
                child: ListView.separated(
                    itemBuilder: (ctx, index) =>
                        BuildTopRated(model: topRatedSheikhs[index]),
                    separatorBuilder: (ctx, index) => SizedBox(
                          height: screenHeight(context) / 78,
                        ),
                    itemCount: 2,
                    physics: const BouncingScrollPhysics()),
              ),
              SizedBox(height: screenHeight(context) / 25),
              const BuildWeddingCard(),
              SizedBox(height: screenHeight(context) / 42),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'مأذون مقترح',
                    style: TextStyle(
                      fontSize: screenWidth(context) / 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight(context) / 70),
              SizedBox(
                height: screenHeight(context) * 0.2,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        BuildSuggestedItem(model: topRatedSheikhs[index]),
                    separatorBuilder: (context, index) => SizedBox(
                          width: screenWidth(context) * 0.04,
                        ),
                    itemCount: topRatedSheikhs.length),
              ),
              SizedBox(
                height: screenHeight(context)/12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
