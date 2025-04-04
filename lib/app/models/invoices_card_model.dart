import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoices_card_model.g.dart';

@JsonSerializable()
class InvoicesCardModel extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'invoice_id')
  final String? invoiceId;

  @JsonKey(name: 'card_name')
  final String? cardName;

  @JsonKey(name: 'user_full_name')
  final String? userFullName;

  @JsonKey(name: 'card_number')
  final String? cardNumber;

  @JsonKey(name: 'card_code')
  final String? cardCode;

  @JsonKey(name: 'expiry_month')
  final String? expiryMonth;

  @JsonKey(name: 'expiry_year')
  final String? expiryYear;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const InvoicesCardModel({
    this.id,
    this.userId,
    this.invoiceId,
    this.cardName,
    this.userFullName,
    this.cardNumber,
    this.cardCode,
    this.expiryMonth,
    this.expiryYear,
    this.createdAt,
    this.updatedAt,
  });

  // JSON'dan modeli dönüştürme işlemi
  factory InvoicesCardModel.fromJson(Map<String, dynamic> json) =>
      _$InvoicesCardModelFromJson(json);

  // Modeli JSON'a dönüştürme işlemi
  Map<String, dynamic> toJson() => _$InvoicesCardModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        invoiceId,
        cardName,
        userFullName,
        cardNumber,
        cardCode,
        expiryMonth,
        expiryYear,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'InvoicesCardModel(id: $id, userId: $userId, invoiceId: $invoiceId, cardName: $cardName, '
        'userFullName: $userFullName, cardNumber: $cardNumber, cardCode: $cardCode, '
        'expiryMonth: $expiryMonth, expiryYear: $expiryYear, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
