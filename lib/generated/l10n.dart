// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get readMore {
    return Intl.message(
      'Read more',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Read less`
  String get readLess {
    return Intl.message(
      'Read less',
      name: 'readLess',
      desc: '',
      args: [],
    );
  }

  /// `Genre`
  String get genre {
    return Intl.message(
      'Genre',
      name: 'genre',
      desc: '',
      args: [],
    );
  }

  /// `Rating & Score`
  String get ratingAndScore {
    return Intl.message(
      'Rating & Score',
      name: 'ratingAndScore',
      desc: '',
      args: [],
    );
  }

  /// `Release Information`
  String get releaseInformation {
    return Intl.message(
      'Release Information',
      name: 'releaseInformation',
      desc: '',
      args: [],
    );
  }

  /// `Released on`
  String get releasedOn {
    return Intl.message(
      'Released on',
      name: 'releasedOn',
      desc: '',
      args: [],
    );
  }

  /// `Available for`
  String get availableFor {
    return Intl.message(
      'Available for',
      name: 'availableFor',
      desc: '',
      args: [],
    );
  }

  /// `Publisher`
  String get publisher {
    return Intl.message(
      'Publisher',
      name: 'publisher',
      desc: '',
      args: [],
    );
  }

  /// `Developer`
  String get developer {
    return Intl.message(
      'Developer',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `Screenshots`
  String get screenshots {
    return Intl.message(
      'Screenshots',
      name: 'screenshots',
      desc: '',
      args: [],
    );
  }

  /// `Explore games all over the world!`
  String get mainSectionCTA {
    return Intl.message(
      'Explore games all over the world!',
      name: 'mainSectionCTA',
      desc: '',
      args: [],
    );
  }

  /// `Found {foundText} for {keyword}`
  String mainSectionSearchTitle(Object foundText, Object keyword) {
    return Intl.message(
      'Found $foundText for $keyword',
      name: 'mainSectionSearchTitle',
      desc: '',
      args: [foundText, keyword],
    );
  }

  /// `game`
  String get game {
    return Intl.message(
      'game',
      name: 'game',
      desc: '',
      args: [],
    );
  }

  /// `games`
  String get games {
    return Intl.message(
      'games',
      name: 'games',
      desc: '',
      args: [],
    );
  }

  /// `Give me a clue so I can find you a game`
  String get searchPlaceholder {
    return Intl.message(
      'Give me a clue so I can find you a game',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, it seems like we couldn't find any game with the keyword you searched for.\nPlease try using a different keyword or browse our collection of games to find something interesting to play.`
  String get emptySearchText {
    return Intl.message(
      'Sorry, it seems like we couldn\'t find any game with the keyword you searched for.\nPlease try using a different keyword or browse our collection of games to find something interesting to play.',
      name: 'emptySearchText',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, the error is on us anyway.\nYou can still try again without limitation :)`
  String get somethingErrorText {
    return Intl.message(
      'Sorry, the error is on us anyway.\nYou can still try again without limitation :)',
      name: 'somethingErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'id', countryCode: 'ID'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
