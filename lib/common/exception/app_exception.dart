import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => message;

  @override
  List<Object> get props => [message];
}