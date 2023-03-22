import 'package:dats/models/standing_model/standing_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'standings_list_model.g.dart';

@JsonSerializable()
class StandingsListModel {
  @JsonKey()
  final List<StandingModel> standings;

  StandingsListModel(
      this.standings,
      );

  factory StandingsListModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return _$StandingsListModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StandingsListModelToJson(this);
  }
}
