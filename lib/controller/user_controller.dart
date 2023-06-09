import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watty_clone/model/user_info_model.dart';
import 'dart:convert';

class UserController extends GetxController {
  late UserInfoModel newUser;

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
  RxMap user = {}.obs;

  //RxString userName = "".obs;
  //RxString userImg = "".obs;
  //RxString userMail = "".obs;
  //RxString userDesc = "".obs;
  //RxString userMbti = "".obs;
  RxList selectedFoods = [].obs;

  Future<void> setUserModel(String name, String img, String mail, String desc,
      String mbti, List<String> favorite) async {
    newUser = UserInfoModel(
      name: name,
      profileImg: img,
      mail: mail,
      favorite: favorite,
      mbti: mbti,
      userDesc: desc,
    );

    print(newUser.toJson());
    //print(newUser.toJson()['name']);

    await setUserData(newUser);
  }

  static Future<void> setUserData(UserInfoModel user) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (!pref.containsKey("user")) {
      pref.setString("user", json.encode(user.toJson()));
    }
  }

  Future<void> getUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    user.value = json.decode(pref.getString("user")!);
  }

  // 이름 수정
  void updateName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    user["name"] = name;
    pref.setString("user", json.encode(user.toJson()));
  }

  // 소개글 수정
  void updateDesc(String desc) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    user["userDesc"] = desc;
    pref.setString("user", json.encode(user.toJson()));
  }

  // mbti 수정
  void updateMbti(String mbti) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    user["mbti"] = mbti;
    pref.setString("user", json.encode(user.toJson()));
  }

  // favorite food 수정
  void updateFavorite() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    user["favorite"] = selectedFoods;
    pref.setString("user", json.encode(user.toJson()));
  }

  void reset() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  void setSelectedFoods() async {
    await getUserData();

    selectedFoods.value = user['favorite'];
  }
}
