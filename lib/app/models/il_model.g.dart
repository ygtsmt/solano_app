// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'il_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IlModel _$IlModelFromJson(Map<String, dynamic> json) => IlModel(
      il: json['il'] as String,
      ilceler:
          (json['ilceler'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$IlModelToJson(IlModel instance) => <String, dynamic>{
      'il': instance.il,
      'ilceler': instance.ilceler,
    };
