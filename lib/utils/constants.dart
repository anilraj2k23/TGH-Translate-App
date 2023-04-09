import 'utils.dart';

class ApiConstants{
static String get  apiKey => _apiKey;
static const String _apiKey = '2087128806msh6856147b0abc5e9p1630f5jsna6287abb731e';
static const String apiHost = 'google-translate1.p.rapidapi.com';
static const String baseUrl = 'https://google-translate1.p.rapidapi.com/language/translate/v2';
static const String languagesEndpoint = '/languages?target=en';
static const String detectEndpoint = '/detect';
}

class AppColors{
  static MaterialColor myPrimarySwatch = const MaterialColor(
    0xFF232527,
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