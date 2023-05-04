import 'package:flutter/material.dart';
import 'package:watty_clone/screens/home_screen.dart';
import 'package:watty_clone/screens/mypage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/mypage": (context) => const MyPage(),
      },
    );
  }
}
