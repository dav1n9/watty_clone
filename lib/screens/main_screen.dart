import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
              iconSize: 30.0,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '오늘부터 모든 날들이',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '맛있을 거야! ✨',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 350.0,
                enableInfiniteScroll: false,
              ),
              items: [
                {'Brand Story', "알고쓰면 더 즐겁다"},
                {'왓티 가이드', "왓티를 즐기는 쉬운 방법법"},
                {'왓티 베타버전 안내', "함께 키워나가요 우리리"},
                {'왓티스트 안내', "왓티의 아티스트"},
                {'FAQ', "자주 묻는 질문문"},
                {'플레이리스트 안내', "금방 옵니다 기다려주세요"},
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 240,
                            ),
                            Text(
                              i.first,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              i.last,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ));
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            color: Colors.grey.shade100,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [SizedBox()],
                ),
                Text(
                  '여러분의 피드백을 기다리고 있어요',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  '기능상 오류, 아쉬운 점, 개선 아이디어 모두 환영해요',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
