import 'package:flutter/material.dart';
import 'package:maazoon/screens/home_page/home_page.dart';
import 'package:maazoon/screens/more_screen/more.dart';
import 'package:maazoon/screens/reservs/reservsScreen.dart';
import 'package:maazoon/shared/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {

  int activeScreen = 0;

  List navScreens = [
    HomePage(),
    ReservsScreen(),
    MoreScreen()
  ];

  void selectScreen(int id) {
    setState(() {
      activeScreen = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navScreens[activeScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        currentIndex: activeScreen,
        backgroundColor: AppColors.navBar,
        selectedItemColor: AppColors.primaryGreen,
        items: [
          BottomNavigationBarItem(
            icon:Image.asset(activeScreen==0?'assets/images/shome.png':'assets/images/home.png'),
            label:"title".tr(),
          ),
          BottomNavigationBarItem(
            icon:Image.asset(activeScreen==1?'assets/images/stimes.png':'assets/images/times.png'),
            label:'حجوزاتي',
          ),
          BottomNavigationBarItem(
            icon:Image.asset(activeScreen==2?'assets/images/scategs.png':'assets/images/categs.png'),
            label:'المزيد',
          ),

        ],
      ),
    );
  }
}
