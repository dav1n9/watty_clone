import 'package:flutter/material.dart';

class BottomNavi extends StatefulWidget {
  final void Function(int) onTap;
  const BottomNavi({
    super.key,
    required this.onTap,
  });

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        widget.onTap(index);
        setState(() {
          selectedIndex = index;
        });
        print(selectedIndex);
        //Scaffold.of(context).showBottomSheet((context) => Container());
      },
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      selectedItemColor: Colors.grey[800],
      unselectedItemColor: Colors.grey[500],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.adjust_rounded),
          label: 'Record',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
    );
  }
}
