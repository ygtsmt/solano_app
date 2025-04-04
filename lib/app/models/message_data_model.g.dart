// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDataModel _$MessageDataModelFromJson(Map<String, dynamic> json) =>
    MessageDataModel(
      messageId: json['message_id'] as String?,
      userId: json['user_id'] as String?,
      psychologistId: json['psychologist_id'] as String?,
      userName: json['user_name'] as String?,
      psychologistName: json['psychologist_name'] as String?,
      userImage: json['user_image'] as String?,
      psychologistImage: json['psychologist_image'] as String?,
      psychologistType: json['psychologist_type'] as String?,
    );

Map<String, dynamic> _$MessageDataModelToJson(MessageDataModel instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'user_id': instance.userId,
      'psychologist_id': instance.psychologistId,
      'user_name': instance.userName,
      'psychologist_name': instance.psychologistName,
      'user_image': instance.userImage,
      'psychologist_image': instance.psychologistImage,
      'psychologist_type': instance.psychologistType,
    };
