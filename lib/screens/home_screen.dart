import 'package:flutter/material.dart';
import 'package:translator_app/models/translated_model.dart';
import 'package:translator_app/services/api_services/translate_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: Translate.getTranslatedText(text: 'what are you doing', targetLang: 'ml'),
            builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data?.data.translations[0].translatedText ?? '');
          }
          return Center(child: CircularProgressIndicator(),);
        }),
      ),
    );
  }
}
