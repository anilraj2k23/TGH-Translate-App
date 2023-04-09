import 'package:provider/provider.dart';
import 'package:translator_app/provider/selected_language_provider.dart';
import 'package:translator_app/services/api_services/translate_api.dart';

import 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // To store and show user selected languages.
  String? inputLanguageName;
  String? outputLanguageName;

  // To store and sent user selected languages.
  String? inputLanguageCode;
  String? outputLanguageCode;

  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var selectedLanguage = Provider.of<SelectedLanguageProvider>(context);

    SizedBox columnSpace = SizedBox(height: 20.h);
    SizedBox rowSpace = SizedBox(width: 10.w);

    return Scaffold(
        backgroundColor: const Color(0xFF141618),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Text Translation',
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
                columnSpace,
                const Divider(
                  color: Colors.white54,
                ),
                columnSpace,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: BuildTranslateButton(
                          columnSpace: columnSpace,
                          sheetTitle: 'From',
                          buttonLabel:
                              selectedLanguage.selectedInputLanguage?.name ??
                                  'Translate From'),
                    ),
                    rowSpace,
                    const Icon(
                      Icons.compare_arrows,
                      color: Colors.white60,
                    ),
                    rowSpace,
                    Expanded(
                      // Input language is not necessary. Auto detect, if not selected.
                      child: BuildTranslateButton(
                          columnSpace: columnSpace,
                          sheetTitle: 'To',
                          buttonLabel: 'Translate To'),
                    )
                  ],
                ),
                columnSpace,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Translate From',
                      style: TextStyle(
                          color: Colors.white38, fontWeight: FontWeight.w500),
                    ),
                    rowSpace,
                    Text(
                      '(${selectedLanguage.selectedInputLanguage?.name ?? 'Select a language'})',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white60),
                    )
                  ],
                ),
                columnSpace,
                TextFormField(
                  // input field enable only if  target language is selected.
                  enabled: outputLanguageCode != null,

                  onChanged: (text) async {
                    // translated texts are coming !
                    if (outputLanguageCode != null) {
                      _translate(
                          inputText: text,
                          targetLang: outputLanguageCode!,
                          sourceLang:
                              selectedLanguage.selectedInputLanguage?.language ??
                                  '');
                    }
                  },
                  controller: _inputController,
                  cursorColor: const Color(0xFFD4AF37),
                  minLines: 7,
                  maxLines: 10,
                  maxLength: 2300,
                  style: TextStyle(fontSize: 18.sp, color: Colors.white60),
                ),
                columnSpace,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Translate To',
                      style: TextStyle(
                          color: Colors.white38, fontWeight: FontWeight.w500),
                    ),
                    rowSpace,
                    Text(
                      '(${outputLanguageName ?? 'Select a language'})',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white60),
                    )
                  ],
                ),
                columnSpace,
                TextFormField(
                  // Disabled text input, though it is used as a translations view area.
                  enabled: false,
                  controller: _outputController,
                  minLines: 7,
                  maxLines: 10,
                  maxLength: 2300,
                  cursorColor: const Color(0xFFD4AF37),
                  style: TextStyle(color: Colors.white60, fontSize: 18.sp),
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                )
              ],
            ),
          ),
        )));
  }

  Future<void> _translate(
      {required String inputText,
      required String targetLang,
      String sourceLang = ''}) async {
    final response = await Translate.getTranslatedText(
        text: inputText, targetLang: targetLang, sourceLang: sourceLang);
    final translatedText = response.data.translations[0].translatedText;
    setState(() {
      _outputController.text = translatedText;
    });
  }
}
