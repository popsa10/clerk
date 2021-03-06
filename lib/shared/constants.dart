import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xffF1F1F1);
const Color kPrimaryColor = Color(0xff082640);
const Color kSecondaryColor = Color(0xffD67205);
const Color kDialogBoxColor = Color(0xffF6F6F6);
const kLoadingCircle = CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
);
BoxDecoration kCustomBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 5,
    )
  ],
);

String userId = "";

String translationApiKey = "AIzaSyAxHcXzqV6YWKJZ9i5VKgmm1IPlJjy5hfc";
String summarizationApiKey = "8e1917c7882728671ecb3e1690e92cfd";
