import 'package:raw_games/api/client/dio_client.dart';
import 'package:raw_games/api/interface/response_list.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_request.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_response.dart';
import 'package:raw_games/api/repository/game/model/game_request.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/di/service_locator.dart';

class GameRepositoryImpl implements GameRepository {
  final _dioClient = serviceLocator<DioClient>();
  final _gamePath = '/games';
  final _screenshotPath = '/screenshots';

  @override
  Future<ResponseList<GameResponse>> getListOfGames(GameRequest request) async {
    final response = await _dioClient.get(
      _gamePath,
      queryParameters: request.toJson(),
    );

    final responseData = ResponseList.fromJson(
      response.data,
      (json) => GameResponse.fromJson(json as Map<String, dynamic>),
    );

    return responseData;
  }

  @override
  Future<GameDetailResponse> getDetail({required int gameId}) async {
    final response = await _dioClient.get('$_gamePath/$gameId');

    final responseData = GameDetailResponse.fromJson(response.data);

    return responseData;
  }

  @override
  Future<ResponseList<GameScreenshotResponse>> getScreenshots(
      GameScreenshotRequest request) async {
    final response = await _dioClient.get(
      '$_gamePath/${request.gameId}$_screenshotPath',
      queryParameters: request.toJson(),
    );

    final responseData = ResponseList.fromJson(
      response.data,
      (json) => GameScreenshotResponse.fromJson(json as Map<String, dynamic>),
    );

    return responseData;
  }
}
