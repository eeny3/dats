import 'package:dats/models/table_item_model/table_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'standing_model.g.dart';

@JsonSerializable()
class StandingModel {
  @JsonKey()
  final List<TableItemModel> table;

  StandingModel(
      this.table,
      );

  factory StandingModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return _$StandingModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StandingModelToJson(this);
  }
}
