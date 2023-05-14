import 'dart:ui';

import 'package:raw_games/api/interface/response_list.dart';
import 'package:raw_games/api/repository/game/model/game_detail/developer_response.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/api/repository/game/model/game_detail/genre_response.dart';
import 'package:raw_games/api/repository/game/model/game_detail/publisher_response.dart';
import 'package:raw_games/api/repository/game/model/platform_response.dart';
import 'package:raw_games/api/repository/game/model/platform_wrapper.dart';

final mockGameDetailResponse = GameDetailResponse(
    3498,
    "Grand Theft Auto V",
    [
      PlatformWrapper(PlatformResponse(1, "PC", "pc")),
      PlatformWrapper(PlatformResponse(2, "PlayStation 3", "playstation3")),
      PlatformWrapper(PlatformResponse(3, "PlayStation 4", "playstation4")),
      PlatformWrapper(PlatformResponse(4, "Xbox 360", "xbox-360")),
      PlatformWrapper(PlatformResponse(5, "Xbox One", "xbox-one")),
      PlatformWrapper(PlatformResponse(6, "PlayStation 5", "playstation5")),
      PlatformWrapper(
          PlatformResponse(7, "Xbox Series S/X", "xbox-series-s-x")),
    ],
    92,
    "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
    4.47,
    "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \nSimultaneous storytelling from three unique perspectives: \nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.\n\nEspañol\nRockstar Games se hizo más grande desde su entrega anterior de la serie. Obtienes la construcción del mundo complicada y realista de Liberty City de GTA4 en el escenario de Los Santos, un viejo favorito de los fans, GTA San Andreas. 561 vehículos diferentes (incluidos todos los transportes que puede operar) y la cantidad aumenta con cada actualización.\nNarración simultánea desde tres perspectivas únicas:\nSigue a Michael, ex-criminal que vive su vida de ocio lejos del pasado, Franklin, un niño que busca un futuro mejor, y Trevor, el pasado exacto del que Michael está tratando de huir.\nGTA Online proporcionará muchos desafíos adicionales incluso para los jugadores experimentados, recién llegados del modo historia. Ahora tendrás otros jugadores cerca que pueden ayudarte con la misma probabilidad que arruinar tu misión. Los jugadores pueden experimentar todas las mecánicas de GTA actualizadas a través del personaje personalizable único, y el contenido de la comunidad combinado con el sistema de nivelación tiende a mantener a todos ocupados y comprometidos.",
    DateTime(2013, 9, 17),
    "http://www.rockstargames.com/V/",
    null,
    [
      DeveloperResponse(1, "Rockstar North"),
      DeveloperResponse(2, "Rockstar Games")
    ],
    [GenreResponse(1, "Action"), GenreResponse(2, "Adventure")],
    [PublisherResponse(1, "Rockstar Games")]);

final mockError = Exception('error');

ResponseList mockResponseList<T>({List<T>? results, bool isError = false}) {
  return ResponseList(
    results?.length,
    results ?? [],
    isError ? mockError : null,
  );
}

Map<String, dynamic> mockResponseListAsJson<T>(
    {List<T>? results,
    required Object? Function(T value) toJsonT,
    bool isError = false}) {
  return <String, dynamic>{
    'count': results?.length,
    'results': results?.map(toJsonT).toList(),
    'error': isError ? mockError : null,
  };
}

const mockLocale = Locale('en_US');
