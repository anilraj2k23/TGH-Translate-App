import 'utils.dart';

class ApiConstants{
static const String apiKey = 'cf6ae7f339msh80a97301132b0a7p15c230jsn58aa11bef470';
static const String apiHost = 'google-translate1.p.rapidapi.com';
static const String baseUrl = 'https://google-translate1.p.rapidapi.com/language/translate/v2';
static const String languagesEndpoint = '/languages?target=en';
static const String detectEndpoint = '/detect';
}

class AppColors{
  static MaterialColor myPrimarySwatch = const MaterialColor(
    0xFF232527, // primary color value in hexadecimal
    <int, Color>{
      50: Color(0xFFE0E0E0),
      100: Color(0xFFB3B3B3),
      200: Color(0xFF808080),
      300: Color(0xFF4D4D4D),
      400: Color(0xFF262626),
      500: Color(0xFF232527),
      600: Color(0xFF1F2124),
      700: Color(0xFF1B1D20),
      800: Color(0xFF17191C),
      900: Color(0xFF0E0F12),
    },
  );

}