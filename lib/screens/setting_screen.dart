import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent, // 투명색으로
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('계정'),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      '프로필 수정',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      '계정 관리',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      '알림 설정',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 26, bottom: 8.0),
              child: Text('지원'),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      '고객센터',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      '의견 보내기',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
