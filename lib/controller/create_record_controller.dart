import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateRecordController extends GetxController {
  List<bool> kindOfFood = List.filled(14, false).obs;
  List<bool> type = List.filled(3, false).obs;

  RxList imgList = [].obs;
  RxString place = "".obs;
  RxString desc = "".obs;
  RxDouble rating = 0.0.obs;
  RxList selectedTag = [].obs;

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
      if (kindOfFood[index]) {
        return true;
      } else {
        return false;
      }
    } else if (tagType == 1) {
      if (type[index]) {
        return true;
      } else {
        return false;
      }
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
}
