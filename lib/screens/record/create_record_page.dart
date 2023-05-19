import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watty_clone/controller/create_record_controller.dart';
import 'package:watty_clone/screens/record/write_content_page.dart';

class CreateRecordPage extends StatefulWidget {
  const CreateRecordPage({super.key});

  @override
  State<CreateRecordPage> createState() => _CreateRecordPageState();
}

class _CreateRecordPageState extends State<CreateRecordPage> {
  final recordController = Get.put(CreateRecordController());

  final ImagePicker picker = ImagePicker();
  //List<XFile> imgList = [];

  @override
  void initState() {
    super.initState();
    //recordController.pickImages();
    pick();
    // imgList = recordController.imgList.cast<XFile>();
  }

  Future<void> pick() async {
    await recordController.pickImages();
  }

  // void pickImages() async {
  // var requestStatus = await Permission.storage.request();
  //var status = await Permission.photos.status;

  //if (requestStatus.isGranted) {
  //final images = await picker.pickMultiImage();
  //setState(() {
  // imgList = images;
  //imgLength = images.length;
  //});
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(
            () => Text(
                '${recordController.clickedImgIndex.value + 1}/ ${recordController.imgList.length}'),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WriteContentPage(),
                    ),
                  );

                  // recordController.setImgList(imgList);
                },
                child: const Text(
                  '다음',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ))
          ],
          centerTitle: true,
          backgroundColor: Colors.black),
      body: Column(
        children: [
          Obx(
            () => Image.file(
              File(recordController.imgList
                  .cast<XFile>()[recordController.clickedImgIndex.value]
                  .path),
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: recordController.imgList
                    .cast<XFile>()
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          recordController.clickedImg(e);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.file(
                            File(e.path),
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
