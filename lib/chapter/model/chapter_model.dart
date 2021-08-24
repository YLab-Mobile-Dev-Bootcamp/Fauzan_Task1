// To parse this JSON data, do
//
//     final chapterModel = chapterModelFromJson(jsonString);

import 'dart:convert';

ChapterList chapterListFromJson(String str) =>
    ChapterList.fromJson(json.decode(str));

String chapterListToJson(ChapterList data) => json.encode(data.toJson());

class ChapterList {
  ChapterList({
    this.chapters,
  });

  List<ChapterModel>? chapters;

  factory ChapterList.fromJson(Map<String, dynamic> json) => ChapterList(
        chapters: List<ChapterModel>.from(
            json["chapters"].map((x) => ChapterModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chapters": List<dynamic>.from(chapters!.map((x) => x.toJson())),
      };
}

class ChapterModel {
  ChapterModel({
    this.id,
    this.revelationPlace,
    this.revelationOrder,
    this.bismillahPre,
    this.nameSimple,
    this.nameComplex,
    this.nameArabic,
    this.versesCount,
    this.pages,
    this.translatedName,
  });

  int? id;
  String? revelationPlace;
  int? revelationOrder;
  bool? bismillahPre;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  int? versesCount;
  List<int>? pages;
  TranslatedName? translatedName;

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        id: json["id"],
        revelationPlace: json["revelation_place"],
        revelationOrder: json["revelation_order"],
        bismillahPre: json["bismillah_pre"],
        nameSimple: json["name_simple"],
        nameComplex: json["name_complex"],
        nameArabic: json["name_arabic"],
        versesCount: json["verses_count"],
        pages: List<int>.from(json["pages"].map((x) => x)),
        translatedName: TranslatedName.fromJson(json["translated_name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "revelation_place": revelationPlace,
        "revelation_order": revelationOrder,
        "bismillah_pre": bismillahPre,
        "name_simple": nameSimple,
        "name_complex": nameComplex,
        "name_arabic": nameArabic,
        "verses_count": versesCount,
        "pages": List<dynamic>.from(pages!.map((x) => x)),
        "translated_name": translatedName!.toJson(),
      };
}

class TranslatedName {
  TranslatedName({
    required this.languageName,
    required this.name,
  });

  LanguageName languageName;
  String name;

  factory TranslatedName.fromJson(Map<String, dynamic> json) => TranslatedName(
        languageName: languageNameValues.map![json["language_name"]]!,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language_name": languageNameValues.reverse![languageName],
        "name": name,
      };
}

enum LanguageName { ENGLISH }

final languageNameValues = EnumValues({"english": LanguageName.ENGLISH});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
