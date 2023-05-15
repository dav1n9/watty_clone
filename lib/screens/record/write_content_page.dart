import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

class WriteContentPage extends StatefulWidget {
  final List<XFile> imgList;
  const WriteContentPage({super.key, required this.imgList});

  @override
  State<WriteContentPage> createState() => _WriteContentPageState();
}

class _WriteContentPageState extends State<WriteContentPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // 종류 태그 리스트
  List<String> selectedTag = [];
  List<bool> kindOfFood = List.filled(14, false);
  // 형태 태그 리스트
  List<bool> type = List.filled(3, false);

  final titleInputController = TextEditingController();
  final contentInputController = TextEditingController();
  double rating = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget unclickedTagBtn(String title, List list, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // 버튼 색깔 바꾸기 구현부분
          // 리스트 해당 부분 true로.
          list[index] = true;
          selectedTag.add(title);
          //print("index $index : ${list[index]}");
          // print(selectedTag);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade200, // 입체감
        elevation: 0,
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget clickedTagBtn(String title, List list, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          list[index] = false;
          selectedTag.remove(title);
          //print("index $index : ${list[index]}");
          //print(selectedTag);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey, // 입체감
        elevation: 0,
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내돈내먹 레코드'),
        actions: const [Icon(Icons.photo_library_outlined)],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: titleInputController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: '어디서 드셨어요?',
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            TextField(
              controller: contentInputController,
              decoration: const InputDecoration(
                  labelText: '어디서 무얼 드셨나요? 나의 경험을 자유롭게 적어주세요.', hintText: 'hi'),
              maxLines: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '나만의 별점',
                    style: TextStyle(fontSize: 16),
                  ),
                  // 별점 만들기 (flutter_rating_bar)
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.6),
                    itemSize: 24.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (r) {
                      rating = r;
                    },
                  )
                ],
              ),
            ),
            ExpansionTile(
              title: const Text('종류 태그'),
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[0])
                          ? clickedTagBtn('한식', kindOfFood, 0)
                          : unclickedTagBtn('한식', kindOfFood, 0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[1])
                          ? clickedTagBtn('중식', kindOfFood, 1)
                          : unclickedTagBtn('중식', kindOfFood, 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[2])
                          ? clickedTagBtn('일식', kindOfFood, 2)
                          : unclickedTagBtn('일식', kindOfFood, 2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[3])
                          ? clickedTagBtn('양식', kindOfFood, 3)
                          : unclickedTagBtn('양식', kindOfFood, 3),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[4])
                          ? clickedTagBtn('분식', kindOfFood, 4)
                          : unclickedTagBtn('분식', kindOfFood, 4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[5])
                          ? clickedTagBtn('세계음식', kindOfFood, 5)
                          : unclickedTagBtn('세계음식', kindOfFood, 5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[6])
                          ? clickedTagBtn('치킨/피자/버거', kindOfFood, 6)
                          : unclickedTagBtn('치킨/피자/버거', kindOfFood, 6),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[7])
                          ? clickedTagBtn('야식/안주류', kindOfFood, 7)
                          : unclickedTagBtn('야식/안주류', kindOfFood, 7),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[8])
                          ? clickedTagBtn('도시락', kindOfFood, 8)
                          : unclickedTagBtn('도시락', kindOfFood, 8),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (kindOfFood[9])
                          ? clickedTagBtn('브런치/샐러드', kindOfFood, 9)
                          : unclickedTagBtn('브런치/샐러드', kindOfFood, 9),
                    ),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('형태 태그'),
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (type[0])
                          ? clickedTagBtn('방문', type, 0)
                          : unclickedTagBtn('방문', type, 0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (type[1])
                          ? clickedTagBtn('배달', type, 1)
                          : unclickedTagBtn('배달', type, 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (type[2])
                          ? clickedTagBtn('포장', type, 2)
                          : unclickedTagBtn('포장', type, 2),
                    ),
                  ],
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('키워드 태그'),
            ),
            ElevatedButton(
              onPressed: () {
                for (var img in widget.imgList) {
                  print("imgPath: ${img.path}");
                }
                print("첫번째 textField : ${titleInputController.text}");
                print("두번째 textField : ${contentInputController.text}");
                print("Rating: $rating");
                print("TagList : $selectedTag");
              },
              child: const Text(
                '완료',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
