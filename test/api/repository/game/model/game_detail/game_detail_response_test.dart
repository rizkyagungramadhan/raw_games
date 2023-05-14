import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/api/repository/game/model/i_game_response.dart';

void main() {
  group('Validate GameDetailResponse object', () {
    const id = 1;
    const name = 'Game Name';
    const metacriticScore = 85;
    const imageUrl = 'https://example.com/image.jpg';
    const rating = 4.5;
    const description = 'Game description';
    final releaseDate = DateTime.now();
    const website = 'https://example.com';
    const metacriticUrl = 'https://example.com/metacritic';

    test('fromJson creates correct instance', () {
      // Assert
      final json = <String, dynamic>{
        'id': id,
        'name': name,
        'platforms': [],
        'metacritic': metacriticScore,
        'background_image': imageUrl,
        'rating': rating,
        'description_raw': description,
        'released': releaseDate.toIso8601String(),
        'website': website,
        'metacritic_url': metacriticUrl,
        'developers': [],
        'genres': [],
        'publishers': [],
      };

      // Act
      final result = GameDetailResponse.fromJson(json);

      // Assert
      expect(result, isA<IGameResponse>());
      expect(result.id, equals(id));
      expect(result.name, equals(name));
      expect(result.platforms, equals([]));
      expect(result.metacriticScore, equals(metacriticScore));
      expect(result.imageUrl, equals(imageUrl));
      expect(result.rating, equals(rating));
      expect(result.description, equals(description));
      expect(result.releaseDate, equals(releaseDate));
      expect(result.website, equals(website));
      expect(result.metacriticUrl, equals(metacriticUrl));
      expect(result.developers, []);
      expect(result.genres, []);
      expect(result.publishers, []);
    });
  });
}
