import 'package:dats/models/team_model/team_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_item_model.g.dart';

@JsonSerializable()
class TableItemModel {
  @JsonKey()
  final TeamModel team;

  @JsonKey()
  final int won;

  @JsonKey()
  final int draw;

  @JsonKey()
  final int lost;

  @JsonKey()
  final int points;

  TableItemModel(
    this.team,
    this.won,
    this.draw,
    this.lost,
    this.points,
  );

  factory TableItemModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$TableItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TableItemModelToJson(this);
  }
}
