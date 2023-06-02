import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watty_clone/model/user_info_model.dart';
import 'dart:convert';

class UserController extends GetxController {
  late UserInfoModel newUser;

  RxMap user = {}.obs;
  RxString userName = "".obs;
  RxString userImg = "".obs;
  RxString userMail = "".obs;
  RxString userDesc = "".obs;
  RxString userMbti = "".obs;
  RxList favorite = [].obs;

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

  void updateName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await getUserData();

    user["name"] = name;
    pref.setString("user", json.encode(user.toJson()));
  }
}
