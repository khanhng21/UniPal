import 'package:flutter/material.dart';
import 'package:uni_pal/Login.dart';
import 'package:uni_pal/Home.dart';
import 'package:uni_pal/Profile/Profile2.dart';
import 'package:uni_pal/Profile/AccountSetting.dart';
import 'package:uni_pal/Profile/ProfileHome.dart';
import 'package:uni_pal/SearchResult.dart';
import 'package:uni_pal/MyListing.dart';
import 'package:uni_pal/PurchaseHistory.dart';
import 'package:uni_pal/Mainmenu.dart';
import 'package:uni_pal/SignUp/Signup1.dart';
import 'package:uni_pal/SignUp/Signup2.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => MainMenu(),
  '/login': (BuildContext context) => Login(),
  '/signup1': (BuildContext context) => Signup1(),
  '/signup2': (BuildContext context) => Signup2(),
  '/home': (BuildContext context) => Home(),
  '/profile2': (BuildContext context) => Profile2(),
  '/accountSetting': (BuildContext context) => AccountSetting(),
  '/profileHome': (BuildContext context) => ProfileHome(),
  '/search': (BuildContext context) => SearchResult(),
  '/mylisting': (BuildContext context) => MyListing(),
  '/purchase': (BuildContext context) => PurchaseHistory(),
};
