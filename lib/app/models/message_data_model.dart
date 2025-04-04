import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_data_model.g.dart'; // JsonSerializable için gereklidir

@JsonSerializable()
class MessageDataModel extends Equatable {
  @JsonKey(name: 'message_id')
  final String? messageId;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'psychologist_id')
  final String? psychologistId;

  @JsonKey(name: 'user_name')
  final String? userName;

  @JsonKey(name: 'psychologist_name')
  final String? psychologistName;

  @JsonKey(name: 'user_image')
  final String? userImage;

  @JsonKey(name: 'psychologist_image')
  final String? psychologistImage;

  @JsonKey(name: 'psychologist_type')
  final String? psychologistType;

  const MessageDataModel({
    this.messageId,
    this.userId,
    this.psychologistId,
    this.userName,
    this.psychologistName,
    this.userImage,
    this.psychologistImage,
    this.psychologistType,
  });

  // JSON'dan Dart objesine dönüştürme
  factory MessageDataModel.fromJson(Map<String, dynamic> json) =>
      _$MessageDataModelFromJson(json);

  // Dart objesini JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$MessageDataModelToJson(this);

  @override
  List<Object?> get props => [
        messageId,
        userId,
        psychologistId,
        userName,
        psychologistName,
        userImage,
        psychologistImage,
        psychologistType,
      ];
}
