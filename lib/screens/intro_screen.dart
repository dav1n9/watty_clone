import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:watty_clone/controller/user_controller.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _fetch1(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //해당 부분은 data를 아직 받아 오지 못했을때
            if (snapshot.hasData == false) {
              return Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_xD7kztjVaC.json');
            }
            //error가 발생하게 될 경우 반환하게 되는 부분
            else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(fontSize: 15),
                ),
              );
            }
            // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행
            // 화면 이동하니까 필요x
            else {
              return const Text('성공');
            }
          },
        ),
      ),
    );
  }

  Future<void> _fetch1() async {
    await Future.delayed(const Duration(seconds: 4));
    userController.setUserModel("다빈", "img", "email");
    Navigator.pushReplacementNamed(context, "/home");
  }
}