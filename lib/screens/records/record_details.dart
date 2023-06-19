import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watty_clone/controller/create_record_controller.dart';

class RecordDetails extends StatefulWidget {
  const RecordDetails({super.key});

  @override
  State<RecordDetails> createState() => _RecordDetailsState();
}

class _RecordDetailsState extends State<RecordDetails> {
  final recordController = Get.put(CreateRecordController());
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 투명색으로
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
          icon: isLiked
              ? Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red.shade700,
                )
              : const Icon(CupertinoIcons.heart),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 이미지
              CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                ),
                items: recordController.imgList.map((e) => e.path).map((i) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Image.file(
                      File(i),
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),

              // 사용자 정보
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined, size: 42),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('UserName'),
                    ),
                  ],
                ),
              ),

              // ..정보들...
              Container(
                // alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${recordController.place}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      '${recordController.desc}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: recordController.selectedTag.map((element) {
                        return Text(
                          "#${element.toString()}",
                          style: TextStyle(
                              fontSize: 18, color: Colors.red.shade700),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
