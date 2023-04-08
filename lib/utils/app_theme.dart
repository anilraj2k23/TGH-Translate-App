import 'utils.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      canvasColor: const Color(0xFF2C2E2F),
      primarySwatch: AppColors.myPrimarySwatch,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white10,
          minimumSize: Size.fromHeight(
            0.065.sh,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none),
        counterStyle: const TextStyle(
          color: Colors.white38,
        ),
      ),
    );
  }
}
