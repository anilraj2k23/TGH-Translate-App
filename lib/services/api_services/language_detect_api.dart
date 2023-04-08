import 'package:http/http.dart' as http;
import 'package:translator_app/models/detect_model.dart';
import 'package:translator_app/utils/constants.dart';

class Detect {
  static Future<DetectLanguageModel>  detectLanguage(
      {required String text,
       }) async {
    var headers = {
      'Accept-Encoding': 'application/json',
      'X-RapidAPI-Key': ApiConstants.apiKey,
      'X-RapidAPI-Host': ApiConstants.apiHost,
      'content-type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(ApiConstants.baseUrl+ApiConstants.detectEndpoint));
    request.bodyFields = {
      'q': text,};
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        final detectedLanguage=  detectLanguageModelFromJson(responseBody);
        return detectedLanguage;
      } else {
        throw Exception('Failed to translate');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
