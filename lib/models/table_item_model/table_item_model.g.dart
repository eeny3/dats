// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableItemModel _$TableItemModelFromJson(Map<String, dynamic> json) =>
    TableItemModel(
      TeamModel.fromJson(json['team'] as Map<String, dynamic>),
      json['won'] as int,
      json['draw'] as int,
      json['lost'] as int,
      json['points'] as int,
    );

Map<String, dynamic> _$TableItemModelToJson(TableItemModel instance) =>
    <String, dynamic>{
      'team': instance.team,
      'won': instance.won,
      'draw': instance.draw,
      'lost': instance.lost,
      'points': instance.points,
    };
