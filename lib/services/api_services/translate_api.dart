import 'package:http/http.dart' as http;
import 'package:translator_app/models/translated_model.dart';
import 'package:translator_app/utils/constants.dart';

class Translate {
  static Future<TranslatedModel> getTranslatedText(
      {required String text,
      required String targetLang,
      String? sourceLang}) async {
    var headers = {
      'Accept-Encoding': 'application/json',
      'X-RapidAPI-Key': ApiConstants.apiKey,
      'X-RapidAPI-Host': ApiConstants.apiHost,
      'content-type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(ApiConstants.baseUrl));
    request.bodyFields = {
      'q': text,
      'target': targetLang,
      'source': sourceLang ?? ''
    };
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print(responseBody);
        final translatedText = translatedModelFromJson(responseBody);
        return translatedText;
      } else {
        throw Exception('Failed to translate');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
