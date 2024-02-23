import 'package:flutter/material.dart';
import 'package:maazoon/screens/search/search_screens/map_search.dart';
import 'package:maazoon/screens/search/search_screens/menu_search.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      context: context,
      title: const Text('ابحث'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context) * 0.016,
                vertical: screenHeight(context) * 0.008),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.lightGreen,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  2,
                  (index) => GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      width: screenWidth(context)/2.4,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: currentIndex == index
                                ? AppColors.primaryGreen
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              index == 0 ? 'القائمة' : 'الخريطة',
                              style: TextStyle(
                                fontSize: screenWidth(context)/22,
                                color: currentIndex==index?AppColors.white:AppColors.black
                              ),
                            ),
                          ),
                        ),
                  )),
            ),
          ),
          SizedBox(height: screenHeight(context)*0.05,),
          currentIndex==0?MenuSearch():MapSearch(),
        ],
      ),
    );
  }
}
