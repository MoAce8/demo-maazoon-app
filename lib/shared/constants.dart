import 'package:flutter/material.dart';

 double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}
double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}
//360x780

String smallSentence(String bigSentence){
  if(bigSentence.length > 16){
    return '${bigSentence.substring(0,16)}...';
  }
  else{
    return bigSentence;
  }
}

String firstFewWords(String bigSentence){

  int startIndex = 0, indexOfSpace= bigSentence.length;

  for(int i = 0; i < 6; i++){
    indexOfSpace = bigSentence.indexOf(' ', startIndex);
    if(indexOfSpace == -1){     //-1 is when character is not found
      return bigSentence;
    }
    startIndex = indexOfSpace + 1;
  }

  return '${bigSentence.substring(0, indexOfSpace)} ...';
}

class AppColors{
  static const oliveAccent = Color(0xffC8B05E);
  static const lightOlive = Color(0xffF4EFDF);
  static const darkOlive = Color(0xffa28b3d);
  static const primaryGreen = Color(0xff34593B);
  static const lightGreen = Color(0xff859B89);
  static const redError = Color(0xffD80029);
  static const red = Colors.red;
  static const grey = Color(0xff858585);
  static const navBarGrey = Color(0xffC2C2C2);
  static const navBar = Color(0xffF0F0F0);
  static const lightGrey = Color(0xfffefefe);
  static const darkGrey = Color(0xff4D4D4D);
  static const blue = Color(0xff0137CE);
  static const black = Color(0xff1A1A1A);
  static const greenishWhite = Color(0xffD6DED8);
  static const white = Color(0xffffffff);
  static const search = Color(0xff968447);
  static const star = Color(0xffFDCF00);
  static const grey22 = Color(0xff666666);
  static const grey2 = Color(0xffE0E0E0);
  static const grey50 = Color(0xff3C3C3B);
  static const borderGrey = Color(0xff858585);
  static const notificationIcon = Color(0xffDED09E);
  static const notificationBackground = Color(0xffAEBDB1);
  static const moreTitleColor = Color(0xff322C18);

}
