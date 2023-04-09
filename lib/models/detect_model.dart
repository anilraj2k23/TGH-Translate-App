

import 'dart:convert';

DetectLanguageModel detectLanguageModelFromJson(String str) => DetectLanguageModel.fromJson(json.decode(str));

class DetectLanguageModel {
  DetectLanguageModel({
    required this.data,
  });

  Data data;

  factory DetectLanguageModel.fromJson(Map<String, dynamic> json) => DetectLanguageModel(
    data: Data.fromJson(json["data"]),
  );


}

class Data {
  Data({
    required this.detections,
  });

  List<Detection> detections;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detections: List<Detection>.from(json["detections"][0].map((x) => Detection.fromJson(x))),
  );


}

class Detection {
  Detection({
    required this.confidence,
    required this.isReliable,
    required this.language,
  });

  int confidence;
  bool isReliable;
  String language;

  factory Detection.fromJson(Map<String, dynamic> json) => Detection(
    confidence: json["confidence"],
    isReliable: json["isReliable"],
    language: json["language"],
  );

}
