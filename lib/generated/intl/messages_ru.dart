// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(minutes) => "${minutes} минут";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "cast": MessageLookupByLibrary.simpleMessage("Актеры"),
    "description": MessageLookupByLibrary.simpleMessage("Описание"),
    "detail": MessageLookupByLibrary.simpleMessage("Детали"),
    "getMovieError": MessageLookupByLibrary.simpleMessage(
      "Ошибка получения фильма",
    ),
    "getMoviesError": MessageLookupByLibrary.simpleMessage(
      "Ошибка получения фильмов",
    ),
    "homePageTitle": MessageLookupByLibrary.simpleMessage(
      "Что вы хотите посмотреть?",
    ),
    "horrors": MessageLookupByLibrary.simpleMessage("Ужасы"),
    "minutes": m0,
    "nowPlaying": MessageLookupByLibrary.simpleMessage("Смотрят сейчас"),
    "reviews": MessageLookupByLibrary.simpleMessage("Отзывы"),
    "search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "upcoming": MessageLookupByLibrary.simpleMessage("Скоро"),
  };
}
