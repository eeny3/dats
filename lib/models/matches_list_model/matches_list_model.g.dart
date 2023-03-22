// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchesListModel _$MatchesListModelFromJson(Map<String, dynamic> json) =>
    MatchesListModel(
      (json['matches'] as List<dynamic>)
          .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchesListModelToJson(MatchesListModel instance) =>
    <String, dynamic>{
      'matches': instance.matches,
    };
