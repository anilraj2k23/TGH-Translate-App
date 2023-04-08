

import 'dart:convert';

LanguageModel languageModelFromJson(String str) =>
    LanguageModel.fromJson(json.decode(str));


class LanguageModel {
  LanguageModel({
    required this.data,
  });

  Data data;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      LanguageModel(
        data: Data.fromJson(json["data"]),
      );


}

class Data {
  Data({
    required this.languages,
  });

  List<Language> languages;

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );


}

class Language {
  Language({
    required this.language,
    required this.name,
  });

  String language;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) =>
      Language(
        language: json["language"],
        name: json["name"],
      );

}
