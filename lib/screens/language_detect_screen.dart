import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/services/api_services/language_detect_api.dart';

class LanguageDetect extends StatefulWidget {
  const LanguageDetect({Key? key}) : super(key: key);

  @override
  State<LanguageDetect> createState() => _LanguageDetectState();
}

class _LanguageDetectState extends State<LanguageDetect> {
  final TextEditingController _inputFieldController = TextEditingController();
  final TextEditingController _outputFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizedBox columnSpace = SizedBox(height: 70.h);

    return Scaffold(
      backgroundColor: const Color(0xFF141618),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Language Detector',
                    style: TextStyle(color: Colors.white, fontSize: 25.sp),
                  ),
                ],
              ),
              columnSpace,
              TextFormField(enabled: false,
                textAlign: TextAlign.center,
                // Disabled text input, though it is used as a translations view area.

                controller: _outputFieldController,
                cursorColor: const Color(0xFFD4AF37),
                minLines: 2,
                maxLines: 10,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Language',hintStyle: TextStyle(
                  color: Colors.white38
                )),
                style: TextStyle(fontSize: 40.sp, color: Colors.white60),
              ),
              columnSpace,
              TextFormField(
                onChanged: (text) {
                  _detect(inputText: text);
                },

                controller: _inputFieldController,
                minLines: 7,
                maxLines: 10,
                maxLength: 2300,
                decoration: const InputDecoration(
                    hintText: "Enter your text",
                    hintStyle: TextStyle(color: Colors.white60)),
                cursorColor: const Color(0xFFD4AF37),
                style: TextStyle(color: Colors.white60, fontSize: 18.sp),
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
              )
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _detect({required String inputText}) async {
    final response = await Detect.detectLanguage(text: inputText);
    final detectedLanguage = response.data.detections[0].language;
    setState(() {
      _outputFieldController.text = detectedLanguage;
    });
  }
}
