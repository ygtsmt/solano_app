// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicesCardModel _$InvoicesCardModelFromJson(Map<String, dynamic> json) =>
    InvoicesCardModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      invoiceId: json['invoice_id'] as String?,
      cardName: json['card_name'] as String?,
      userFullName: json['user_full_name'] as String?,
      cardNumber: json['card_number'] as String?,
      cardCode: json['card_code'] as String?,
      expiryMonth: json['expiry_month'] as String?,
      expiryYear: json['expiry_year'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$InvoicesCardModelToJson(InvoicesCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'invoice_id': instance.invoiceId,
      'card_name': instance.cardName,
      'user_full_name': instance.userFullName,
      'card_number': instance.cardNumber,
      'card_code': instance.cardCode,
      'expiry_month': instance.expiryMonth,
      'expiry_year': instance.expiryYear,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
