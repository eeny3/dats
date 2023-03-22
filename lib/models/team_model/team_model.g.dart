// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => TeamModel(
      json['id'] as int,
      json['name'] as String,
      json['tla'] as String?,
      json['crest'] as String,
    );

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tla': instance.tla,
      'crest': instance.crest,
    };
