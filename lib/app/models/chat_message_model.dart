import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatMessage extends Equatable {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'chat_id')
  final String? chatId;

  @JsonKey(name: 'sender_id')
  final String? senderId;

  @JsonKey(name: 'receiver_id')
  final String? receiverId;

  final String? message;

  final int? timestamp;

  @JsonKey(name: '__v')
  final int? version;

  const ChatMessage({
    this.id,
    this.chatId,
    this.senderId,
    this.receiverId,
    this.message,
    this.timestamp,
    this.version,
  });

  /// **JSON'dan ChatMessage objesi oluşturur**
  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  /// **ChatMessage objesini JSON formatına çevirir**
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  @override
  List<Object?> get props =>
      [id, chatId, senderId, receiverId, message, timestamp, version];
}
