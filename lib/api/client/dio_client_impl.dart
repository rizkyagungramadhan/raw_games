import 'package:dio/dio.dart';
import 'package:raw_games/api/client/dio_client.dart';
import 'package:raw_games/common/exception/response_exception.dart';
import 'package:raw_games/utils/env/environment_config.dart';

class DioClientImpl implements DioClient {
  late Dio _dio;

  DioClientImpl._();

  static final DioClientImpl _dioClient = DioClientImpl._();

  ///Initialize [DioClient] only once (Singleton) for API usage
  factory DioClientImpl.initialize() {
    const timeOutDuration = Duration(seconds: 10);

    final dioInstance = Dio(
      BaseOptions(
        baseUrl: EnvironmentConfig.apiUrl,
        connectTimeout: timeOutDuration,
        receiveTimeout: timeOutDuration,
        sendTimeout: timeOutDuration,
        receiveDataWhenStatusError: true,
        queryParameters: {'key': EnvironmentConfig.apiKey},
      ),
    );
    return _dioClient.._dio = dioInstance;
  }

  @override
  Future<Response<dynamic>> get(
    String uriPath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        uriPath,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioError catch (e) {
      throw ResponseException(_handleDioError(e));
    } catch (e) {
      throw ResponseException(_handleDioError(e));
    }
  }

  @override
  Future<Response<dynamic>> post(
    String uriPath, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        uriPath,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioError catch (e) {
      throw ResponseException(_handleDioError(e));
    } catch (e) {
      throw ResponseException(_handleDioError(e));
    }
  }

  String _handleDioError(dynamic error) {
    var errorDescription = '';
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          errorDescription = 'Request to server was cancelled';
          break;
        case DioErrorType.connectionTimeout:
          errorDescription = 'Connection timeout with server';
          break;
        case DioErrorType.connectionError:
          errorDescription =
              'Connection to server failed due to internet connection';
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = 'Receive timeout in connection with server';
          break;
        case DioErrorType.badResponse:
          errorDescription = error.response?.statusCode != null
              ? 'Received invalid status code: ${error.response?.statusCode}'
              // ignore: lines_longer_than_80_chars
              : 'Oops something went wrong :\n ${error.response?.statusMessage != null ? error.response!.statusMessage : 'Unknown error'}';
          break;
        case DioErrorType.sendTimeout:
          errorDescription = 'Send timeout in connection with server';
          break;
        case DioErrorType.badCertificate:
          errorDescription = 'Oops Bad Certificate';
          break;
        case DioErrorType.unknown:
          errorDescription = 'Oops unknown error';
          break;
      }
    } else {
      errorDescription = '$error';
    }
    if (errorDescription.isEmpty) {
      errorDescription = 'Oops something went wrong';
    }
    return errorDescription;
  }
}
