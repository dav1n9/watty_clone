// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) => RecordModel(
      imgList: json['imgList'] as List<dynamic>,
      place: json['place'] as String,
      desc: json['desc'] as String,
      rating: (json['rating'] as num).toDouble(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RecordModelToJson(RecordModel instance) =>
    <String, dynamic>{
      'imgList': instance.imgList,
      'place': instance.place,
      'desc': instance.desc,
      'rating': instance.rating,
      'tags': instance.tags,
    };
