// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandingModel _$StandingModelFromJson(Map<String, dynamic> json) =>
    StandingModel(
      (json['table'] as List<dynamic>)
          .map((e) => TableItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StandingModelToJson(StandingModel instance) =>
    <String, dynamic>{
      'table': instance.table,
    };
