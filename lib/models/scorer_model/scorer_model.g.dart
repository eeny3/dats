// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scorer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScorerModel _$ScorerModelFromJson(Map<String, dynamic> json) => ScorerModel(
      PlayerModel.fromJson(json['player'] as Map<String, dynamic>),
      TeamModel.fromJson(json['team'] as Map<String, dynamic>),
      json['goals'] as int?,
      json['assists'] as int?,
      json['penalties'] as int?,
    );

Map<String, dynamic> _$ScorerModelToJson(ScorerModel instance) =>
    <String, dynamic>{
      'player': instance.player,
      'team': instance.team,
      'goals': instance.goals,
      'assists': instance.assists,
      'penalties': instance.penalties,
    };
