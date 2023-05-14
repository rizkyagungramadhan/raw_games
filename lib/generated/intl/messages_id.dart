// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a id locale. All the
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
  String get localeName => 'id';

  static String m0(foundText, keyword) =>
      "Ditemukan ${foundText} untuk ${keyword}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Tentang"),
        "availableFor": MessageLookupByLibrary.simpleMessage("Tersedia untuk"),
        "developer": MessageLookupByLibrary.simpleMessage("Pengembang"),
        "game": MessageLookupByLibrary.simpleMessage("permainan"),
        "games": MessageLookupByLibrary.simpleMessage("permainan"),
        "genre": MessageLookupByLibrary.simpleMessage("Genre"),
        "mainSectionCTA": MessageLookupByLibrary.simpleMessage(
            "Jelajahi game di seluruh dunia!"),
        "mainSectionSearchTitle": m0,
        "publisher": MessageLookupByLibrary.simpleMessage("Penerbit"),
        "ratingAndScore": MessageLookupByLibrary.simpleMessage("Rating & Skor"),
        "readLess": MessageLookupByLibrary.simpleMessage("Baca lebih sedikit"),
        "readMore": MessageLookupByLibrary.simpleMessage("Baca lebih banyak"),
        "releaseInformation":
            MessageLookupByLibrary.simpleMessage("Informasi Rilis"),
        "releasedOn": MessageLookupByLibrary.simpleMessage("Dirilis pada"),
        "screenshots": MessageLookupByLibrary.simpleMessage("Tangkapan Layar"),
        "searchPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Beri petunjuk apa yang ingin ku temukan untukmu")
      };
}
