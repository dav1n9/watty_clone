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

  int itemCount = 10;

  @override
  void initState() {
    userController = Get.put(UserController());
    getUser();
    super.initState();
  }

  void getUser() {
    setState() async {
      await userController.getUserData();
      userController.setSelectedFoods();
    }

    print("getUserData: ${userController.newUser.value.name}");
    print("getUserData: ${userController.newUser.value.favorite}");
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
                    '${userController.newUser.value.name}!',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90), //모서리를 둥글게
              border: Border.all(color: Colors.black87, width: 10),
            ), //테두리
            child: Container(
              margin: const EdgeInsets.all(4), // 이미지 테두리의 흰색 부분
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90.0),
                child: Image.network(
                  userController.newUser.value.profileImg,
                  errorBuilder: (BuildContext? context, Object? exception,
                      StackTrace? stackTrace) {
                    return const Icon(Icons.image_not_supported_outlined);
                  },
                ),
              ),
            ),
          ),

          Obx(
            () => Column(
              children: [
                Text(
                  userController.newUser.value.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userController.newUser.value.mbti,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userController.newUser.value.userDesc,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140,
                height: 140,
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
              itemCount: itemCount, //item 개수
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
                        'Playlist',
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
          Visibility(
            visible: itemCount > 0 ? false : true,
            child: Container(
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
