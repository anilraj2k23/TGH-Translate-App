import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
 import 'package:translator_app/provider/selected_language_provider.dart';
import 'package:translator_app/screens/screens.dart';
import 'package:translator_app/services/api_services/languages_api.dart';

class BuildTranslateButton extends StatelessWidget {
  const BuildTranslateButton({
    super.key,
    required this.columnSpace,
    required this.sheetTitle,
    required this.buttonLabel,
  });

  final SizedBox columnSpace;
  final String sheetTitle;
  final String buttonLabel;

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
                              columnSpace,
                              Text(
                                sheetTitle,
                                style: TextStyle(color: Colors.white54),
                              ),
                              columnSpace,
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.white54,
                                    )),
                              ),
                              columnSpace,
                              const Text(
                                'All Languages',
                                style: TextStyle(color: Colors.white54),
                              )
                            ],
                          )),
                      Expanded(child: FutureBuilder(
                        future: LanguageRequest.fetchLanguages(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CupertinoActivityIndicator(
                                radius: 18.r,
                                animating: true,
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
                                      title:   Text(
                                       snapshot.data.data.languages[index].name,
                                        style: const TextStyle(color: Colors.white60),
                                      ),onTap: (){
                                    setLanguage.setInputLanguage( snapshot.data.data.languages[index]);
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
                            }else {
                              return const Text('Empty data');
                            }
                          }else {
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
      child: Text(buttonLabel),
    );
  }
}
