import 'package:json_annotation/json_annotation.dart';

part 'full_time_model.g.dart';

@JsonSerializable()
class FullTimeModel {
  @JsonKey()
  final int home;

  @JsonKey()
  final int away;

  FullTimeModel(
    this.home,
    this.away,
  );

  factory FullTimeModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$FullTimeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FullTimeModelToJson(this);
  }
}
