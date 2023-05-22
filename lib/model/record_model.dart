import 'package:json_annotation/json_annotation.dart';

part 'record_model.g.dart';

@JsonSerializable()
class RecordModel {
  List<dynamic> imgList;
  String place;
  String desc;
  double rating;
  List<String> tags;

  RecordModel(
      {required this.imgList,
      required this.place,
      required this.desc,
      required this.rating,
      required this.tags});

  factory RecordModel.fromJson(Map<String, dynamic> json) =>
      _$RecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecordModelToJson(this);
}
