import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maazoon/screens/login_screen/login_screen.dart';
import 'package:maazoon/screens/more_screen/more_card.dart';
import 'package:maazoon/screens/more_screen/nested_screens/join_us_screen.dart';
import 'package:maazoon/shared/constants.dart';

class MoreScreen extends StatefulWidget {
  MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool notifOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navBar,
        title: const Text('المزيد'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) / 22,
            vertical: screenHeight(context) / 28),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              'عبدالعزيز سيد الصرفى',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: screenWidth(context) / 18.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight(context) / 50,
            ),
            const MoreTitle(title: 'الملف الشخصي'),
            BuildMoreCard(pic: 'Profile', name: 'الملف الشخصي', onTap: () {}),
            const Divider(),
            BuildMoreCard(
                pic: 'Lock Password', name: 'تعديل كلمة السر', onTap: () {}),
            const Divider(),
            BuildMoreCard(pic: 'Wallet', name: 'محفظتي', onTap: () {}),
            const MoreTitle(title: 'من نحن'),
            BuildMoreCard(pic: 'about', name: 'عن مأذون', onTap: () {}),
            const Divider(),
            BuildMoreCard(pic: 'terms', name: 'الأحكام والشروط', onTap: () {}),
            const Divider(),
            BuildMoreCard(pic: 'Shield', name: 'سياسة الخصوصية', onTap: () {}),
            const Divider(),
            BuildMoreCard(pic: 'faq', name: 'الأسئلة الشائعة', onTap: () {}),
            const MoreTitle(title: 'الإعدادات'),
            BuildMoreCard(pic: 'Chat', name: 'تواصل معنا', onTap: () {}),
            const Divider(),
            BuildMoreCard(pic: 'Share', name: 'شارك التطبيق', onTap: () {}),
            const Divider(),
            BuildMoreCard(pic: 'bag', name: 'انضم الى قائمةالمأذونين', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const JoinUsScreen()));
            }),
            const Divider(),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: screenHeight(context) / 78),
              child: Row(
                children: [
                  Image.asset('assets/images/Bell.png'),
                  SizedBox(
                    width: screenWidth(context) / 60,
                  ),
                  Text(
                    'الإشعارات',
                    style: TextStyle(
                      fontSize: screenWidth(context) / 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey22,
                    ),
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    value: notifOn,
                    onChanged: (val) {
                      setState(() {
                        notifOn = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const LoginScreen()));
              },
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenHeight(context) / 78),
                child: Row(
                  children: [
                    Image.asset('assets/images/Logout.png'),
                    SizedBox(
                      width: screenWidth(context) / 60,
                    ),
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        fontSize: screenWidth(context) / 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.redError,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.redError,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight(context) / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'هذا التطبيق موثق من وزارة ',
                  style: TextStyle(
                    color: AppColors.grey22,
                    fontSize: screenWidth(context) / 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'التجارة السعودية',
                  style: TextStyle(
                    color: AppColors.grey22,
                    fontSize: screenWidth(context) / 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MoreTitle extends StatelessWidget {
  const MoreTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context) / 45,
              vertical: screenHeight(context) / 200),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: AppColors.moreTitleColor,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: screenWidth(context) / 25.5,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight(context) * 0.0025,
        ),
      ],
    );
  }
}
