import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watty_clone/controller/user_controller.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late final UserController userController;

  @override
  void initState() {
    userController = Get.put(UserController());
    getUser();
    super.initState();
  }

  void getUser() async {
    await userController.getUserData();
    print("newUser.toJson(): ${userController.newUser.toJson()['name']}");
    print("getUserData: ${userController.userName.value}");
    print("getUserData: ${userController.userImg.value}");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/setting");
              },
              icon: const Icon(Icons.menu),
              iconSize: 30,
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => Text(
                    '${userController.userName.value}!',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.all(10),
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90.0),
                child: Image.network(userController.userImg.value, errorBuilder:
                    (BuildContext? context, Object? exception,
                        StackTrace? stackTrace) {
                  return const Icon(Icons.image_not_supported_outlined);
                }),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140,
                height: 140,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: const EdgeInsets.all(20),
                color: const Color.fromARGB(255, 204, 57, 47),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '나만의 Playlist 💽',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '10 곡',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // 그리드

          Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: GridView.builder(
              itemCount: 10, //item 개수
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                //item 의 반목문 항목 형성
                return Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.lightGreen,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '나만의 Playlist 💽',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$index 번',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                const Text('나의 맛있는 순간을\n레코드로 남겨보세요'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade800,
                  ),
                  child: const Text(
                    "레코드 작성",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
