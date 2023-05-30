import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  String name;
  String profileImg;
  String mail;
  String userDesc;
  String mbti;
  List<String> favorite;

  UserInfoModel({
    required this.name,
    required this.profileImg,
    required this.mail,
    required this.userDesc,
    required this.mbti,
    required this.favorite,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
