import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:watty_clone/model/record_model.dart';

class CreateRecordController extends GetxController {
  late RecordModel newRecord;

  List<String> foodsTag = [
    '한식',
    '중식',
    '일식',
    '양식',
    '분식',
    '세계음식',
    '치킨/피자/버거',
    '야식/안주류',
    '도시락',
    '브런치/샐러드',
  ];
  List<String> typeTag = [
    '방문',
    '배달',
    '포장',
  ];
  List<bool> kindOfFood = List.filled(14, false).obs;
  List<bool> type = List.filled(3, false).obs;

  RxList imgList = [].obs;
  RxString place = "".obs;
  RxString desc = "".obs;
  RxDouble rating = 0.0.obs;
  RxList selectedTag = [].obs;

  RxInt clickedImgIndex = 0.obs;

  final ImagePicker picker = ImagePicker();

  // RxnString null 가능
  void setImgList(List<XFile> list) {
    imgList.value = list;
  }

  void setRating(double r) {
    rating.value = r;
    // rating.update((val) {
    // val = r;
    // });
  }

  void setPlace(String text) {
    place.value = text;
  }

  void setDesc(String text) {
    desc.value = text;
  }

  void setFoodTags(int index, String title) {
    if (kindOfFood[index]) {
      kindOfFood[index] = false;
      selectedTag.remove(title);
    } else {
      kindOfFood[index] = true;
      selectedTag.add(title);
    }
  }

  void setTypeTags(int index, String title) {
    if (type[index]) {
      type[index] = false;
      selectedTag.remove(title);
    } else {
      type[index] = true;
      selectedTag.add(title);
    }
  }

  bool isSeleceted(int tagType, int index) {
    if (tagType == 0) {
      return kindOfFood[index];
    } else if (tagType == 1) {
      return type[index];
    }
    return false;
  }

  void clear() {
    kindOfFood = List.filled(14, false);
    type = List.filled(3, false);

    imgList.clear();
    place.value = "";
    desc.value = "";
    rating.value = 0.0;
    selectedTag.clear();
  }

  Future<void> pickImages() async {
    var requestStatus = await Permission.storage.request();
    //var status = await Permission.photos.status;

    if (requestStatus.isGranted) {
      imgList.value = await picker.pickMultiImage();
      clickedImgIndex.value = 0; // 이미지 선택되면 선택된 인덱스 0으로
    }
  }

  void clickedImg(XFile e) {
    clickedImgIndex.value = imgList.indexOf(e);
  }

  // Model -> Json
  void setRecordModel() {
    newRecord = RecordModel(
        imgList: imgList.map((e) => e.path).toList(),
        place: place.value,
        desc: desc.value,
        rating: rating.value,
        tags: selectedTag.map((e) => e.toString()).toList());

    print(newRecord.toJson());
  }
}
