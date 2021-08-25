// To parse this JSON data, do
//
//     final juzList = juzListFromJson(jsonString);

import 'dart:convert';

JuzList juzListFromJson(String str) => JuzList.fromJson(json.decode(str));

String juzListToJson(JuzList data) => json.encode(data.toJson());

class JuzList {
  JuzList({
    this.juzs,
  });

  List<JuzModel>? juzs;

  factory JuzList.fromJson(Map<String, dynamic> json) => JuzList(
        juzs:
            List<JuzModel>.from(json["juzs"].map((x) => JuzModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "juzs": List<dynamic>.from(juzs!.map((x) => x.toJson())),
      };
}

class JuzModel {
  JuzModel({
    this.id,
    this.juzNumber,
    this.verseMapping,
    this.firstVerseId,
    this.lastVerseId,
    this.versesCount,
  });

  int? id;
  int? juzNumber;
  Map<String, String>? verseMapping;
  int? firstVerseId;
  int? lastVerseId;
  int? versesCount;

  factory JuzModel.fromJson(Map<String, dynamic> json) => JuzModel(
        id: json["id"],
        juzNumber: json["juz_number"],
        verseMapping: Map.from(json["verse_mapping"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        firstVerseId: json["first_verse_id"],
        lastVerseId: json["last_verse_id"],
        versesCount: json["verses_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "juz_number": juzNumber,
        "verse_mapping": Map.from(verseMapping!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "first_verse_id": firstVerseId,
        "last_verse_id": lastVerseId,
        "verses_count": versesCount,
      };
}
