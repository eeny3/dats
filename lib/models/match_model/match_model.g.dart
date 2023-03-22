// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      json['id'] as int,
      json['status'] as String,
      TeamModel.fromJson(json['homeTeam'] as Map<String, dynamic>),
      TeamModel.fromJson(json['awayTeam'] as Map<String, dynamic>),
      ScoreModel.fromJson(json['score'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'score': instance.score,
    };
