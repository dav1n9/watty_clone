import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watty_clone/screens/home_screen.dart';
import 'package:watty_clone/screens/intro_screen.dart';
import 'package:watty_clone/screens/mypage_screen.dart';
import 'package:watty_clone/screens/setting_page/set_mbti_screen.dart';
import 'package:watty_clone/screens/setting_page/update_profile.dart';
import 'package:watty_clone/screens/setting_screen.dart';

import 'screens/setting_page/set_favorite_food_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const IntroScreen(),
        "/home": (context) => const HomeScreen(),
        "/mypage": (context) => const MyPage(),
        "/setting": (context) => const SettingScreen(),
        "/updateProfile": (context) => const UpdateProfileScreen(),
        "/setMbti": (context) => const SetMbtiScreen(),
        "/setFood": (context) => const SetFavoriteFoodScreen(),
      },
    );
  }
}
