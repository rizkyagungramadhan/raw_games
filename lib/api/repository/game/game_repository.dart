import 'package:raw_games/api/interface/response_list.dart';
import 'package:raw_games/api/repository/game/model/game_request.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';

abstract class GameRepository {
  Future<ResponseList<GameResponse>> getListOfGames(GameRequest request);
}
