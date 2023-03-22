// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scorers_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScorersListModel _$ScorersListModelFromJson(Map<String, dynamic> json) =>
    ScorersListModel(
      (json['scorers'] as List<dynamic>)
          .map((e) => ScorerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScorersListModelToJson(ScorersListModel instance) =>
    <String, dynamic>{
      'scorers': instance.scorers,
    };
