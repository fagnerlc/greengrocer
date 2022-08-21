import 'package:json_annotation/json_annotation.dart';

import 'package:greengrocer/src/models/item_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String title;
  String id;
  @JsonKey(defaultValue: [])
  List<ItemModel> items;
  @JsonKey(defaultValue: 0)
  int pagination;
  CategoryModel({
    required this.title,
    required this.id,
    required this.items,
    required this.pagination,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'id': id});

    return result;
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  String toString() {
    return 'CategoryModel(title: $title, id: $id, items: $items, pagination: $pagination)';
  }
}
