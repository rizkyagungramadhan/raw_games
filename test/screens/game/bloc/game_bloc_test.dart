// TODO(agung): write unit test for every function

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:raw_games/api/repository/game/game_repository.dart';
// import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
// import 'package:raw_games/screens/game/bloc/game_bloc.dart';
//
// import '../../../mock/mock_data.dart';
// import '../../../mock/mocks.dart';
// import '../../../mock/mocks.mocks.dart';
//
//
// void main() {
//   late MockGameRepository mockGameRepository;
//
//   setUpAll(() {
//     initMockDependencies();
//     mockGameRepository = serviceLocatorTest<GameRepository>() as MockGameRepository;
//   });
//
//   group('y', () {
//
//   });
//
//   group('GameBloc', () {
//     const gameId = 1234;
//
//     final gameDetail = mockGameDetailResponse;
//
//     const expectedInitialState = GameState();
//
//     blocTest<GameBloc, GameState>(
//       'emits [isLoading, item] when FetchDetailEvent is added',
//       build: () {
//         when(mockGameRepository.getDetail(gameId: gameId))
//             .thenAnswer((_) async => gameDetail);
//         return GameBloc();
//       },
//       act: (bloc) => bloc.add(const FetchDetailEvent(gameId)),
//       expect: () => [
//         expectedInitialState.copyWith(isLoading: true),
//         expectedInitialState.copyWith(isLoading: false, item: gameDetail),
//       ],
//       verify: (_) {
//         verify(mockGameRepository.getDetail(gameId: gameId)).called(1);
//       },
//     );
//
//     blocTest<GameBloc, GameState>(
//       'emits [getScreenshotError] when FetchScreenshotEvent throws an error',
//       build: () => GameBloc(),
//       act: (bloc) => bloc.add(FetchScreenshotEvent(gameId: gameId)),
//       seed: expectedInitialState.copyWith(screenshots: [
//         GameScreenshotResponse(id: '1', imageUrl: 'http://example.com/screenshot1.png'),
//       ]),
//       expect: () => [
//         expectedInitialState.copyWith(
//           screenshots: [
//             GameScreenshotResponse(id: '1', imageUrl: 'http://example.com/screenshot1.png'),
//           ],
//           getScreenshotError: any,
//         ),
//       ],
//       verify: (_) {
//         verify(mockGameRepository.getScreenshots(any)).called(1);
//       },
//     );
//   });
// }
