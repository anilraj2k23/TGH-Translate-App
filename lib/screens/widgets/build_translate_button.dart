import 'package:translator_app/screens/screens.dart';

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
                                    prefixIcon: Icon(
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
                      Expanded(
                          child: ListView.separated(
                            itemCount: 50,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                contentPadding: EdgeInsets.only(left: 50.w),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r)),
                                tileColor: Color(0xFF121416),
                                title: Text(
                                  'German',
                                  style: TextStyle(color: Colors.white60),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) =>
                                SizedBox(
                                  height: 15.h,
                                ),
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
