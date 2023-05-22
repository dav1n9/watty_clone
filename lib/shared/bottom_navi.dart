import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watty_clone/screens/record/create_record_page.dart';

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
          // + 아이콘 눌렀을 때 bottomsheet
          if (index == 2) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity, // 가로 꽉차게 설정
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                GetPageRoute(
                                    page: () => const CreateRecordPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Text(
                                  '내돈내먹🍽️',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '밖에서 사먹었어요',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color.fromARGB(120, 158, 158, 158),
                        ),
                        //  const SizedBox(
                        //     height: 1,
                        //     width: double.infinity,
                        //    child: DecoratedBox(
                        //      decoration: BoxDecoration(
                        //        color: Color.fromARGB(120, 158, 158, 158),
                        //      ),
                        //    ),
                        //  ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {},
                            child: const Column(
                              children: [
                                Text(
                                  '내가해먹🧑‍🍳',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '집에서 만들어 먹었어요',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            );
          } else {
            selectedIndex = index;
          }
        });
        //print(selectedIndex);
        //Scaffold.of(context).showBottomSheet((context) => Container());
      },
      type: BottomNavigationBarType.fixed, // 애니메이션 없음
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false, // Unselected 라벨 안보이게
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
