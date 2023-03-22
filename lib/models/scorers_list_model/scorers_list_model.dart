import 'package:dats/models/scorer_model/scorer_model.dart';
import 'package:dats/models/standing_model/standing_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scorers_list_model.g.dart';

@JsonSerializable()
class ScorersListModel {
  @JsonKey()
  final List<ScorerModel> scorers;

  ScorersListModel(
      this.scorers,
      );

  factory ScorersListModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return _$ScorersListModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ScorersListModelToJson(this);
  }
}