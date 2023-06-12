import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watty_clone/model/user_info_model.dart';
import 'dart:convert';

class UserController extends GetxController {
  Rx<UserInfoModel> newUser = UserInfoModel(
      name: '',
      profileImg: '',
      mail: '',
      userDesc: '',
      mbti: '',
      favorite: []).obs;

  final List<String> mbti = [
    'ISTJ',
    'ISFJ',
    'INFJ',
    'INTJ',
    'ISTP',
    'ISFP',
    'INFP',
    'INTP',
    'ESTP',
    'ESFP',
    'ENFP',
    'ENTP',
    'ESTJ',
    'ESFJ',
    'ENFJ',
    'ENTJ',
    'MBTI 몰라요',
  ];

  final List<String> food = [
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
    '카페',
    '디저트',
  ];

  //RxMap user = {}.obs;

  //RxString userName = "".obs;
  //RxString userImg = "".obs;
  //RxString userMail = "".obs;
  //RxString userDesc = "".obs;
  //RxString userMbti = "".obs;
  RxList selectedFoods = [].obs;

  Future<void> setUserModel(String name, String img, String mail, String desc,
      String mbti, List<String> favorite) async {
    newUser.value = UserInfoModel(
      name: name,
      profileImg: img,
      mail: mail,
      favorite: favorite,
      mbti: mbti,
      userDesc: desc,
    );

    print(newUser.toJson());
    //print(newUser.toJson()['name']);

    await setUserData(newUser.value);
    setSelectedFoods();
  }

  static Future<void> setUserData(UserInfoModel user) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (!pref.containsKey("user")) {
      pref.setString("user", json.encode(user.toJson()));
    }
  }

  Future<void> getUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    //user.value = json.decode(pref.getString("user")!);
    if (pref.getString("user") != null) {
      newUser.value =
          UserInfoModel.fromJson(json.decode(pref.getString("user")!));
    }
  }

  Future<bool> isData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    //user.value = json.decode(pref.getString("user")!);
    if (pref.containsKey("user")) {
      return true;
    } else {
      return false;
    }
  }

  // 이름 수정
  void updateName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    //user["name"] = name;
    newUser.value.name = name;

    //pref.setString("user", json.encode(user.toJson()));
    pref.setString("user", json.encode(newUser.toJson()));
  }

  // 소개글 수정
  void updateDesc(String desc) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    //user["userDesc"] = desc;
    newUser.value.userDesc = desc;

    //pref.setString("user", json.encode(user.toJson()));
    pref.setString("user", json.encode(newUser.toJson()));
  }

  // mbti 수정
  void updateMbti(String mbti) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    //user["mbti"] = mbti;
    newUser.value.mbti = mbti;
    //pref.setString("user", json.encode(user.toJson()));
    pref.setString("user", json.encode(newUser.toJson()));
  }

  // favorite food 수정
  void updateFavorite() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    //user["favorite"] = selectedFoods;
    newUser.value.favorite = selectedFoods.cast();

    //pref.setString("user", json.encode(user.toJson()));
    pref.setString("user", json.encode(newUser.toJson()));
  }

  void reset() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    print("reset: ${pref.getString("user")}");
  }

  void setSelectedFoods() async {
    await getUserData();

    //selectedFoods.value = user['favorite'];
    selectedFoods.value = newUser.value.favorite;
  }
}
