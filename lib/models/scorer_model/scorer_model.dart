import 'package:dats/models/player_model/player_model.dart';
import 'package:dats/models/score_model/score_model.dart';
import 'package:dats/models/team_model/team_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scorer_model.g.dart';

@JsonSerializable()
class ScorerModel {

  @JsonKey()
  final PlayerModel player;

  @JsonKey()
  final TeamModel team;

  @JsonKey()
  final int? goals;

  @JsonKey()
  final int? assists;

  @JsonKey()
  final int? penalties;

  ScorerModel(
    this.player,
    this.team,
    this.goals,
    this.assists,
    this.penalties,
  );

  factory ScorerModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ScorerModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ScorerModelToJson(this);
  }
}
