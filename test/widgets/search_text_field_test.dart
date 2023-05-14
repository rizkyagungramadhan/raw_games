import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/widgets/search_text_field.dart';

import '../test_utils/test_utils.dart';

void main() {
  group('Validate SearchTextField widget', () {
    const placeholder = 'Search';
    const suffixIcon = Icon(Icons.clear);

    testWidgets('should display SearchTextField with default values',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        buildTestableWidget(
          child: const SearchTextField(placeholder: placeholder),
        ),
      );

      // Find widgets
      final textFieldFinder = find.byType(TextFormField);
      final hintTextFinder = find.text(placeholder);
      final iconFinder = find.byType(Icon);

      // Assert widget
      expect(textFieldFinder, findsOneWidget);
      expect(hintTextFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
    });

    testWidgets('should display SearchTextField with custom values',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        buildTestableWidget(
          child: SearchTextField(
            controller: TextEditingController(text: 'test'),
            placeholder: placeholder,
            onSearch: (value) {},
            onChanged: (value) {},
            suffixIcon: suffixIcon,
            textInputAction: TextInputAction.done,
          ),
        ),
      );

      // Find widgets.
      final textFieldFinder = find.byType(TextFormField);
      final hintTextFinder = find.text(placeholder);
      final iconFinder = find.byType(Icon);

      // Get widget properties.
      final textFieldWidget = tester.widget<TextFormField>(textFieldFinder);
      final textFieldController = textFieldWidget.controller;
      final suffixIconWidget = tester.widget<Widget>(iconFinder);

      // Assert widget.
      expect(textFieldFinder, findsOneWidget);
      expect(hintTextFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);

      // Assert widget properties.
      expect(textFieldController!.text, equals('test'));
      expect(suffixIconWidget, equals(suffixIcon));
    });
  });
}
