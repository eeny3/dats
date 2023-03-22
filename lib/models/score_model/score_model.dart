import 'package:dats/models/full_time_model/full_time_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'score_model.g.dart';

@JsonSerializable()
class ScoreModel {
  @JsonKey()
  final String winner;

  @JsonKey()
  final FullTimeModel fullTime;

  ScoreModel(
    this.winner,
    this.fullTime,
  );

  factory ScoreModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ScoreModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ScoreModelToJson(this);
  }
}
