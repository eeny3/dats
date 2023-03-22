import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  @JsonKey()
  final int id;

  @JsonKey()
  final String name;

  PlayerModel(
    this.id,
    this.name,
  );

  factory PlayerModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$PlayerModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlayerModelToJson(this);
  }
}
