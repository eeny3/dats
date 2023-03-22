import 'package:json_annotation/json_annotation.dart';

part 'team_model.g.dart';

@JsonSerializable()
class TeamModel {
  @JsonKey()
  final int id;

  @JsonKey()
  final String name;

  @JsonKey()
  final String? tla;

  @JsonKey()
  final String crest;

  TeamModel(
    this.id,
    this.name,
    this.tla,
    this.crest,
  );

  factory TeamModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$TeamModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TeamModelToJson(this);
  }
}
