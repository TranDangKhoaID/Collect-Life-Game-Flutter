import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;
  String? name;
  String? type;
  String? img;
  int? number;
  int? quantity;

  ItemModel({
    required this.id,
    this.name,
    this.type,
    this.img,
    this.number,
    this.quantity,
  });

  //
  factory ItemModel.fromRawJson(String str) =>
      ItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  //

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
