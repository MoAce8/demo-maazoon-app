import 'package:flutter/material.dart';
import 'package:maazoon/screens/search/search_screen.dart';
import 'package:maazoon/shared/constants.dart';

class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const SearchScreen())),
      child: Container(
        height: screenHeight(context) * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: AppColors.search,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 5,),
            Text(
              'اسم المأذون',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: screenWidth(context) / 22,
                color: AppColors.grey22,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.search,
              ),
              child: Center(
                child: Text(
                  'ابحث',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: screenWidth(context)/22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
