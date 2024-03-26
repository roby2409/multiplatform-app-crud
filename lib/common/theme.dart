import 'package:flutter/material.dart';

double defaultMargin = 24.0;
double defaultRadius = 10.0;

const Color kPrimaryColor = Color(0xff1A3665);
const Color kBlackColor = Color(0xff1F1449);
const Color kWhiteColor = Color(0xffFFFFFF);
const Color kGreyColor = Color(0xffC7C7C7);
const Color kGreyColorLight = Color(0xffEBEBEB);
const Color kGreenColor = Color(0xff098852);
const Color kBgGreenColor = Color(0xff078650);
const Color kBgGreenColorContainer = Color(0xFFE0FFF2);
const Color kBgGreenColorContainerLight = Color(0xFFEFFFF9);
const Color kGreenColorButton = Color(0xff0A8754);
const Color kGreenColorSecondButton = Color(0xff0DC577);
const Color kGreyColorButton = Color(0xffB5B5B5);
const Color kYellowColor = Color(0xfff0c12a);
const Color kYellowSecondColor = Color(0xffFFFAEC);
const Color kBlueColor = Color(0xFF3DC8D8);
const Color kRedColor = Color(0xffD70000);
const Color kRedColorMedium = Color(0xffFFEBEB);
const Color kRedColorLight = Color(0xffFF7777);
const Color kBackgroundColor = Color(0xffFAFAFA);
const Color kInactiveColor = Color(0xffDBD7EC);
const Color kTransparentColor = Colors.transparent;
const Color kAvailableColor = Color(0xffE0D9FF);
const Color kUnavailableColor = Color(0xffEBECF1);
const Color kFillColor = Color(0xFFFFFFFF);

const TextStyle blackTextStyle = TextStyle(
  fontFamily: "Poppins",
  color: kBlackColor,
);
const TextStyle whiteTextStyle = TextStyle(
  fontFamily: "Poppins",
  color: kWhiteColor,
);
const TextStyle greyTextStyle = TextStyle(
  fontFamily: "Poppins",
  color: kGreyColor,
);
const TextStyle greyTextStyleLight = TextStyle(
  fontFamily: "Poppins",
  color: kGreyColorLight,
);
const TextStyle greenTextStyle = TextStyle(
  fontFamily: "Poppins",
  color: kGreenColor,
);
const TextStyle secondButtonTextStyle = TextStyle(
  fontFamily: "Poppins",
  color: kGreenColorSecondButton,
);
const TextStyle redTextStyle = TextStyle(
  fontFamily: "Poppins",
  color: kRedColor,
);
const TextStyle primaryTextStyle = TextStyle(
  fontFamily: "Poppins",
  color: kPrimaryColor,
);

const TextStyle normalTextStyle = TextStyle(
    fontFamily: "Poppins",
    color: kPrimaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 16.0);

TextStyle customNormalTextStyle({
  required color,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 16.0,
  double letterSpacing = 0,
}) {
  return TextStyle(
    fontFamily: "Poppins",
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    letterSpacing: letterSpacing,
  );
}

const BottomNavigationBarThemeData bottomNavigationBarTheme =
    BottomNavigationBarThemeData(
  selectedItemColor: kPrimaryColor,
  unselectedItemColor: kGreyColorLight,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  type: BottomNavigationBarType.fixed,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

const ColorScheme kColorScheme = ColorScheme(
  primary: kGreenColor,
  primaryContainer: kBlackColor,
  secondary: kGreenColor,
  secondaryContainer: kGreenColor,
  surface: kBlackColor,
  background: kBackgroundColor,
  error: Colors.red,
  onPrimary: kWhiteColor,
  onSecondary: Colors.white,
  onSurface: kBlackColor,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
