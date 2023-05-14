import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/screens/game/section/release_section.dart';
import 'package:raw_games/utils/extensions/date_time_extension.dart';

import '../../../mock/mock_data.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  testWidgets('ReleaseSection displays release information', (tester) async {
    // Arrange
    final item = mockGameDetailResponse();

    // Act
    await tester.pumpWidget(
      buildTestableWidget(
        child: ReleaseSection(item: item),
      ),
    );

    // Assert
    expect(find.text(S.current.releaseInformation), findsOneWidget);
    expect(find.text(S.current.releasedOn), findsOneWidget);
    expect(find.text(item.releaseDate.asFullDate), findsOneWidget);
    expect(find.text(S.current.availableFor), findsOneWidget);
    expect(
      find.text(
        item.publishers.map((p) => p.name).join(', '),
      ),
      findsOneWidget,
    );
    expect(find.text(S.current.developer), findsOneWidget);
    expect(
      find.text(
        item.developers.map((d) => d.name).join(', '),
      ),
      findsOneWidget,
    );
  });
}
