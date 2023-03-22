import 'package:dats/models/score_model/score_model.dart';
import 'package:dats/models/team_model/team_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_model.g.dart';

@JsonSerializable()
class MatchModel {
  @JsonKey()
  final int id;

  @JsonKey()
  final String status;

  @JsonKey()
  final TeamModel homeTeam;

  @JsonKey()
  final TeamModel awayTeam;

  @JsonKey()
  final ScoreModel score;

  MatchModel(
    this.id,
    this.status,
    this.homeTeam,
    this.awayTeam,
    this.score,
  );

  factory MatchModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$MatchModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MatchModelToJson(this);
  }
}
