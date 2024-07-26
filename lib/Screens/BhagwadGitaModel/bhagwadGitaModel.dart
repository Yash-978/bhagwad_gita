import 'package:flutter/material.dart';

class BhagwadGitaModel {
  late int chapter;
  late List<Verses> verses;
  late ChapterName chapterName;

  BhagwadGitaModel({
    required this.chapter,
    required this.verses,
    required this.chapterName,
  });

  factory BhagwadGitaModel.fromJson(Map m1) {
    return BhagwadGitaModel(
      chapter: m1['Chapter'],
      verses: (m1['Verses'] as List)
          .map(
            (e) => Verses.fromJson(e),
          )
          .toList(),
      chapterName: ChapterName.fromJson(m1['ChapterName']),
    );
  }
}

class ChapterName {
  late String chHindi, chEnglish, chGujarati, chSanskrit;

  ChapterName({
    required this.chHindi,
    required this.chEnglish,
    required this.chGujarati,
    required this.chSanskrit,
  });

  factory ChapterName.fromJson(Map m1) {
    return ChapterName(
      chHindi: m1['Hindi'],
      chEnglish: m1['English'],
      chGujarati: m1['Gujarati'],
      chSanskrit: m1['Sanskrit'],
    );
  }
}

class Verses {
  late int verseNumber;
  late Language language;

  Verses({
    required this.verseNumber,
    required this.language,
  });

  factory Verses.fromJson(Map m1) {
    return Verses(
        verseNumber: m1['VerseNumber'],
        language: Language.fromJson(m1['Text']));
  }
}

class Language {
  late String sanskrit, hindi, gujarati, english;

  Language({
    required this.sanskrit,
    required this.hindi,
    required this.gujarati,
    required this.english,
  });

  factory Language.fromJson(Map m1) {
    return Language(
        sanskrit: m1['Sanskrit'],
        hindi: m1['Hindi'],
        gujarati: m1['Gujarati'],
        english: m1['English']);
  }
}
