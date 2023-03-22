// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) => ScoreModel(
      json['winner'] as String,
      FullTimeModel.fromJson(json['fullTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScoreModelToJson(ScoreModel instance) =>
    <String, dynamic>{
      'winner': instance.winner,
      'fullTime': instance.fullTime,
    };
