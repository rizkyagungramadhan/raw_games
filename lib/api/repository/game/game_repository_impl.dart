import 'package:raw_games/api/client/dio_client.dart';
import 'package:raw_games/api/interface/response_list.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/model/game_request.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/di/service_locator.dart';

class GameRepositoryImpl implements GameRepository {
  final _dioClient = serviceLocator<DioClient>();

  @override
  Future<ResponseList<GameResponse>> getListOfGames(GameRequest request) async {
    final response = await _dioClient.get(
      '/games',
      queryParameters: request.toJson(),
    );

    final responseData = ResponseList.fromJson(
      response.data,
      (json) => GameResponse.fromJson(json as Map<String, dynamic>),
    );

    return responseData;
  }
}
