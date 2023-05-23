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
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profileImg': instance.profileImg,
      'mail': instance.mail,
    };
