import 'package:http/http.dart' as http;
import 'package:translator_app/models/language_model.dart';
import 'package:translator_app/utils/constants.dart';


class Language{
  static Future<LanguageModel> fetchLanguages() async {
    var headers = {
      'Accept-Encoding': 'application/json',
      'X-RapidAPI-Key': ApiConstants.apiKey,
      'X-RapidAPI-Host': ApiConstants.apiHost
    };
    var request = http.Request(
        'GET',
        Uri.parse(
         ApiConstants.baseUrl+ApiConstants.languagesEndpoint));
    request.body = '''''';
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        final languages = languageModelFromJson(responseBody);

        return languages;
      } else {
        throw Exception('Failed to load languages');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }


}