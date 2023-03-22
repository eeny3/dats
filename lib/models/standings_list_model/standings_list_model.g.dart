// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standings_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandingsListModel _$StandingsListModelFromJson(Map<String, dynamic> json) =>
    StandingsListModel(
      (json['standings'] as List<dynamic>)
          .map((e) => StandingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StandingsListModelToJson(StandingsListModel instance) =>
    <String, dynamic>{
      'standings': instance.standings,
    };
