import 'package:flutter/material.dart';
import 'package:maazoon/screens/search/search_screen.dart';
import 'package:maazoon/screens/search/search_screens/filters.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';

class SearchScreenBar extends StatelessWidget {
  SearchScreenBar({Key? key}) : super(key: key);

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.search,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: screenWidth(context) * 0.37,
                child: TextFormField(
                  controller: nameController,
                  cursorColor: AppColors.primaryGreen,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(18),
                    hintText: 'اسم المأذون',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.grey2),
                width: screenWidth(context) * 0.008,
                height: screenHeight(context) * 0.037,
              ),
              SizedBox(
                width: screenWidth(context) / 30,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => Filters(),

                  );
                },
                child: Row(
                  children: [
                    Text(
                      'التصفية',
                      style: TextStyle(
                        fontSize: screenWidth(context) / 22,
                      ),
                    ),
                    Image.asset('assets/images/Filter.png'),
                  ],
                ),
              ),
            ],
          ),
          // const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
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
                    fontSize: screenWidth(context) / 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
