import 'package:dats/models/match_model/match_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'matches_list_model.g.dart';

@JsonSerializable()
class MatchesListModel {
  @JsonKey()
  final List<MatchModel> matches;

  MatchesListModel(
    this.matches,
  );

  factory MatchesListModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$MatchesListModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MatchesListModelToJson(this);
  }
}
