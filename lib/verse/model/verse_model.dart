// To parse this JSON data, do
//
//     final verseList = verseListFromJson(jsonString);

import 'dart:convert';

VerseList verseListFromJson(String str) => VerseList.fromJson(json.decode(str));

String verseListToJson(VerseList data) => json.encode(data.toJson());

class VerseList {
  VerseList({
    this.verses,
    this.pagination,
  });

  List<VerseModel>? verses;
  Pagination? pagination;

  factory VerseList.fromJson(Map<String, dynamic> json) => VerseList(
        verses: List<VerseModel>.from(
            json["verses"].map((x) => VerseModel.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "verses": List<dynamic>.from(verses!.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
      };
}

class Pagination {
  Pagination({
    this.perPage,
    this.currentPage,
    this.nextPage,
    this.totalPages,
    this.totalRecords,
  });

  int? perPage;
  int? currentPage;
  dynamic nextPage;
  int? totalPages;
  int? totalRecords;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        perPage: json["per_page"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        totalPages: json["total_pages"],
        totalRecords: json["total_records"],
      );

  Map<String, dynamic> toJson() => {
        "per_page": perPage,
        "current_page": currentPage,
        "next_page": nextPage,
        "total_pages": totalPages,
        "total_records": totalRecords,
      };
}

class VerseModel {
  VerseModel({
    this.id,
    this.verseNumber,
    this.verseKey,
    this.juzNumber,
    this.hizbNumber,
    this.rubNumber,
    this.sajdahType,
    this.sajdahNumber,
    this.textImlaei,
    this.translations,
  });

  int? id;
  int? verseNumber;
  String? verseKey;
  int? juzNumber;
  int? hizbNumber;
  int? rubNumber;
  dynamic sajdahType;
  dynamic sajdahNumber;
  String? textImlaei;
  List<Translation>? translations;

  factory VerseModel.fromJson(Map<String, dynamic> json) => VerseModel(
        id: json["id"],
        verseNumber: json["verse_number"],
        verseKey: json["verse_key"],
        juzNumber: json["juz_number"],
        hizbNumber: json["hizb_number"],
        rubNumber: json["rub_number"],
        sajdahType: json["sajdah_type"],
        sajdahNumber: json["sajdah_number"],
        textImlaei: json["text_imlaei"],
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "verse_number": verseNumber,
        "verse_key": verseKey,
        "juz_number": juzNumber,
        "hizb_number": hizbNumber,
        "rub_number": rubNumber,
        "sajdah_type": sajdahType,
        "sajdah_number": sajdahNumber,
        "text_imlaei": textImlaei,
        "translations":
            List<dynamic>.from(translations!.map((x) => x.toJson())),
      };
}

class Translation {
  Translation({
    this.resourceId,
    this.text,
  });

  int? resourceId;
  String? text;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        resourceId: json["resource_id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "resource_id": resourceId,
        "text": text,
      };
}
