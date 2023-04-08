import 'dart:convert';

TranslatedModel translatedModelFromJson(String str) =>
    TranslatedModel.fromJson(json.decode(str));

class TranslatedModel {
  TranslatedModel({
    required this.data,
  });

  Data data;

  factory TranslatedModel.fromJson(Map<String, dynamic> json) =>
      TranslatedModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.translations,
  });

  List<Translation> translations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );
}

class Translation {
  Translation({
    required this.translatedText,
    this.detectedSourceLanguage,
  });

  String translatedText;
  String? detectedSourceLanguage;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        translatedText: json["translatedText"],
        detectedSourceLanguage: json["detectedSourceLanguage"],
      );
}
