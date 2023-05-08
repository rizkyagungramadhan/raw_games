import 'package:raw_games/common/exception/app_exception.dart';

class ResponseException implements AppException {
  @override
  String message;

  ResponseException(this.message);

  @override
  String toString() => message;
}
