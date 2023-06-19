import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watty_clone/controller/user_controller.dart';

class SetMbtiScreen extends StatefulWidget {
  const SetMbtiScreen({super.key});

  @override
  State<SetMbtiScreen> createState() => _SetMbtiScreenState();
}

class _SetMbtiScreenState extends State<SetMbtiScreen> {
  final userController = Get.put(UserController());
  //late String select = userController.user['mbti'];
  late String select = userController.newUser.value.mbti;

  @override
  void initState() {
    super.initState();
  }

  Widget mbtiBtn(String mbti) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            select = mbti;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              select == mbti ? Colors.red.shade800 : Colors.grey.shade200,
          elevation: 0,
        ),
        child: Text(
          mbti,
          style: TextStyle(
            color: select == mbti ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              '나를 좀 더 표현해볼까요?',
              style: TextStyle(fontSize: 17),
            ),
            const Text(
              '나의 MBTI를 알려주세요',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Wrap(
              children: userController.mbti.map((e) => mbtiBtn(e)).toList(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  userController.updateMbti(select);
                  print('Mbti update! : $select');
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade800,
                  elevation: 0,
                ),
                child: const Text('완료'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
