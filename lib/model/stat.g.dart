// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      (json['baseStat'] as num).toInt(),
      (json['modifier'] as num).toInt(),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'baseStat': instance.baseStat,
      'modifier': instance.modifier,
    };
