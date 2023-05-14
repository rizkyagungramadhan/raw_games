// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(foundText, keyword) => "Found ${foundText} for ${keyword}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "availableFor": MessageLookupByLibrary.simpleMessage("Available for"),
        "developer": MessageLookupByLibrary.simpleMessage("Developer"),
        "emptySearchText": MessageLookupByLibrary.simpleMessage(
            "Sorry, it seems like we couldn\'t find any game with the keyword you searched for.\nPlease try using a different keyword or browse our collection of games to find something interesting to play."),
        "game": MessageLookupByLibrary.simpleMessage("game"),
        "games": MessageLookupByLibrary.simpleMessage("games"),
        "genre": MessageLookupByLibrary.simpleMessage("Genre"),
        "mainSectionCTA": MessageLookupByLibrary.simpleMessage(
            "Explore games all over the world!"),
        "mainSectionSearchTitle": m0,
        "publisher": MessageLookupByLibrary.simpleMessage("Publisher"),
        "ratingAndScore":
            MessageLookupByLibrary.simpleMessage("Rating & Score"),
        "readLess": MessageLookupByLibrary.simpleMessage("Read less"),
        "readMore": MessageLookupByLibrary.simpleMessage("Read more"),
        "releaseInformation":
            MessageLookupByLibrary.simpleMessage("Release Information"),
        "releasedOn": MessageLookupByLibrary.simpleMessage("Released on"),
        "screenshots": MessageLookupByLibrary.simpleMessage("Screenshots"),
        "searchPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Give me a clue so I can find you a game")
      };
}
