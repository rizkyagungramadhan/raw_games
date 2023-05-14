import 'package:equatable/equatable.dart';
import 'package:raw_games/common/exception/app_exception.dart';

class ResponseException extends Equatable implements AppException {
  @override
  final String message;

  const ResponseException(this.message);

  @override
  String toString() => message;

  @override
  List<Object> get props => [message];
}
