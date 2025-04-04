import 'package:equatable/equatable.dart';
import 'package:solano_app/app/errors/failures/failure_tranlation_mixin.dart';

/// A base class for all the failures in the app
sealed class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UnknownFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// This Dart code defines a class [NetworkFailure] that extends the [Failure] class. The
/// [NetworkFailure] class has a constructor that takes a `message` parameter of type `String`. The
/// `message` parameter is then assigned to a final variable `message`.
final class NetworkFailure extends Failure with TranslationMixin {
  NetworkFailure({required String? message}) : _message = message;
  final String? _message;

  String? get errorMessage => translate(_message ?? '');

  @override
  List<Object?> get props => [_message];
}

final class NullResponseFailure extends Failure {
  @override
  List<Object?> get props => [];
}
