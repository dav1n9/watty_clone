import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watty_clone/controller/user_controller.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late final UserController userController;
  late TextEditingController nickNameController;
  late TextEditingController descController;

  @override
  void initState() {
    userController = Get.put(UserController());
    getUser();
    // nickNameController = TextEditingController(text: userController.user["name"]);
    // descController = TextEditingController(text: userController.user["userDesc"]);

    super.initState();
  }

  void getUser() {
    setState(() {
      userController.getUserData();
      nickNameController =
          TextEditingController(text: userController.newUser.value.name);
      descController =
          TextEditingController(text: userController.newUser.value.userDesc);

      userController.setSelectedFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '프로필 수정',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      //userController.user["profileImg"],
                      userController.newUser.value.profileImg,
                      errorBuilder: (BuildContext? context, Object? exception,
                          StackTrace? stackTrace) {
                        return const Icon(Icons.image_not_supported_outlined);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('닉네임'),
                  TextFormField(
                    controller: nickNameController,
                  ),
                  const SizedBox(height: 20),
                  const Text('소개'),
                  TextFormField(
                    controller: descController,
                  ),
                  const SizedBox(height: 20),
                  const Text('MBTI >'),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/setMbti');
                    },
                    style: OutlinedButton.styleFrom(),
                    child: Obx(
                      () => Text(
                        userController.newUser.value.mbti,
                        style: TextStyle(color: Colors.red.shade700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/setFood');
                    },
                    child: const Text('선호하는 음식 종류 >'),
                  ),
                  Obx(
                    () => Wrap(
                      children: userController.selectedFoods.map((element) {
                        return OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(),
                          child: Text(
                            '$element',
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    print("update profile!");
                    userController.updateName(nickNameController.value.text);
                    userController.updateDesc(descController.value.text);
                    //userController.reset();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                    elevation: 0,
                  ),
                  child: const Text("확인"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
