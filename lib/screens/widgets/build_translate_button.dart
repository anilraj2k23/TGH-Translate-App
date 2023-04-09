import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/models/language_model.dart';
import 'package:translator_app/provider/selected_language_provider.dart';
import 'package:translator_app/screens/screens.dart';
import 'package:translator_app/services/api_services/languages_api.dart';

class BuildTranslateButton extends StatefulWidget {
  const BuildTranslateButton({
    super.key,
    required this.columnSpace,
    required this.sheetTitle,
    required this.buttonLabel,
    required this.isInputLanguageButton,
  });

  final SizedBox columnSpace;
  final String sheetTitle;
  final String buttonLabel;
  final bool isInputLanguageButton;

  @override
  State<BuildTranslateButton> createState() => _BuildTranslateButtonState();
}

class _BuildTranslateButtonState extends State<BuildTranslateButton> {
  late Future<LanguageModel> _languageFetch;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _languageFetch =LanguageRequest.fetchLanguages();

  }

  @override
  Widget build(BuildContext context) {
    var setLanguage = Provider.of<SelectedLanguageProvider>(context);
    return FilledButton(
      onPressed: () {
        showModalBottomSheet(
            isDismissible: true,
            enableDrag: true,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r)),
            context: context,
            builder: (builder) {
              return SizedBox(
                height: 0.7.sh,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 30.w,
                      right: 30,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      Container(
                          color: const Color(0xFF2C2E2F),
                          height: 0.20.sh,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.columnSpace,
                              Text(
                                widget.sheetTitle,
                                style: TextStyle(color: Colors.white54),
                              ),
                              widget.columnSpace,
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    )),
                              ),
                              widget.columnSpace,
                              const Text(
                                'All Languages',
                                style: TextStyle(color: Colors.white54),
                              )
                            ],
                          )),
                      Expanded(
                          child: FutureBuilder(
                        future: _languageFetch,
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CupertinoActivityIndicator(
                                radius: 18.r,
                                animating: true,
                                color: Colors.white70,
                              ),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text('Language fetch error occurred'));
                            } else if (snapshot.hasData) {
                              return ListView.separated(
                                itemCount: snapshot.data.data.languages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                      snapshot.data.data.languages[index].name,
                                      style: const TextStyle(
                                          color: Colors.white60),
                                    ),
                                    onTap: () {
                                      if (widget.isInputLanguageButton) {
                                        setLanguage.setInputLanguage(snapshot
                                            .data.data.languages[index]);
                                      } else {
                                        setLanguage.setOutputLanguage(snapshot
                                            .data.data.languages[index]);
                                      }

                                      Navigator.pop(context);
                                    },
                                    contentPadding: EdgeInsets.only(left: 50.w),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    tileColor: const Color(0xFF121416),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(
                                  height: 15.h,
                                ),
                              );
                            } else {
                              return const Text('Empty data');
                            }
                          } else {
                            return Text('State: ${snapshot.connectionState}');
                          }
                        },
                      )),
                      Container(
                        color: const Color(0xFF2C2E2F),
                        alignment: Alignment.center,
                        height: 0.10.sh,
                        width: double.infinity,
                        child: const Text(
                          'There Are 6 Languages With The Letter G',
                          style: TextStyle(color: Colors.white54),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Text(widget.buttonLabel),
    );
  }
}
