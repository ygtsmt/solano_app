import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'il_model.g.dart';

@JsonSerializable(explicitToJson: true)
class IlModel extends Equatable {
  const IlModel({required this.il, required this.ilceler});

  factory IlModel.fromJson(Map<String, dynamic> json) =>
      _$IlModelFromJson(json);

  Map<String, dynamic> toJson() => _$IlModelToJson(this);

  final String il;
  final List<String> ilceler;

  @override
  List<Object?> get props => [il, ilceler];
}
