import 'package:flutter/material.dart';
import 'package:watty_clone/screens/main_screen.dart';
import 'package:watty_clone/screens/mypage_screen.dart';
import 'package:watty_clone/screens/record_screen.dart';
import 'package:watty_clone/shared/bottom_navi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavi(
        onTap: (newIndex) {
          setState(() {
            // Add 이모티콘 눌렀을 때는 화면이동x
            if (newIndex != 2) {
              index = newIndex;
            }
          });
        },
      ),
      body: IndexedStack(
        index: index,
        children: [
          const MainScreen(),
          RecordScreen(),
          const MainScreen(),
          const MyPage(),
        ],
      ),
    );
  }
}
