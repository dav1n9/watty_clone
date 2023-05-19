import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:watty_clone/controller/create_record_controller.dart';

class WriteContentPage extends StatefulWidget {
  const WriteContentPage({super.key});

  @override
  State<WriteContentPage> createState() => _WriteContentPageState();
}

class _WriteContentPageState extends State<WriteContentPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final recordController = Get.put(CreateRecordController());

  final titleInputController = TextEditingController();
  final contentInputController = TextEditingController();

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

  Widget clickedTagBtn(String title, int tagType, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          tagType == 0
              ? recordController.setFoodTags(index, title)
              : recordController.setTypeTags(index, title);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: recordController.isSeleceted(tagType, index)
            ? Colors.grey
            : Colors.grey.shade200,
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
              //controller: titleInputController,
              initialValue: recordController.place.value,
              onChanged: (value) {
                setState(() {
                  // 한글자 바뀔때마다 정보 updqte ?  비효율?
                  recordController.setPlace(value);
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: '어디서 드셨어요?',
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            TextFormField(
              //controller: contentInputController,
              initialValue: recordController.desc.value,
              onChanged: (value) {
                // 한글자 바뀔때마다 정보 updqte ?  비효율?
                recordController.setDesc(value);
              },
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
                    initialRating: recordController.rating.value,
                    minRating: 0,
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
                      recordController.setRating(r);
                    },
                  )
                ],
              ),
            ),
            ExpansionTile(
              title: const Text('종류 태그'),
              children: [
                Wrap(
                  children: [
                    for (int i = 0;
                        i < recordController.foodsTag.length;
                        i++) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child:
                            clickedTagBtn(recordController.foodsTag[i], 0, i),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('형태 태그'),
              children: [
                Wrap(
                  children: [
                    for (int i = 0;
                        i < recordController.typeTag.length;
                        i++) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: clickedTagBtn(recordController.typeTag[i], 1, i),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('키워드 태그'),
            ),
            ElevatedButton(
              onPressed: () {
                print(
                    "Get - img : ${recordController.imgList.map((e) => e.path)}");
                print("Get - Place : ${recordController.place}");
                print("Get - Desc : ${recordController.desc}");
                print("Get - Rating : ${recordController.rating}");
                print(
                    "Get - TagList : ${recordController.selectedTag.map((e) => e)}");
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
