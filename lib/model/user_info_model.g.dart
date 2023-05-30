// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      name: json['name'] as String,
      profileImg: json['profileImg'] as String,
      mail: json['mail'] as String,
      userDesc: json['userDesc'] as String,
      mbti: json['mbti'] as String,
      favorite:
          (json['favorite'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profileImg': instance.profileImg,
      'mail': instance.mail,
      'userDesc': instance.userDesc,
      'mbti': instance.mbti,
      'favorite': instance.favorite,
    };
