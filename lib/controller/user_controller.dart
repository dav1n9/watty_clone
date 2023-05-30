import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watty_clone/model/user_info_model.dart';

class UserController extends GetxController {
  late UserInfoModel newUser;

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

    pref.setString("name", user.toJson()['name']);
    pref.setString("profileImg", user.toJson()['profileImg']);
    pref.setString("mail", user.toJson()['mail']);
    pref.setString("userDesc", user.toJson()['userDesc']);
    pref.setString("mbti", user.toJson()['mbti']);
    // 리스트는...?
  }

  Future<void> getUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    userName.value = pref.getString("name")!;
    userImg.value = pref.getString("profileImg")!;
    userMail.value = pref.getString("mail")!;
    userDesc.value = pref.getString("userDesc")!;
    userMbti.value = pref.getString("mbti")!;
  }
}
