 import 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? translateFrom;
  String? translateTo;

  String? translateFromCode;
  String? translateToCode;

  @override
  Widget build(BuildContext context) {
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
                          buttonLabel: 'Translate From'),
                    ),
                    rowSpace,
                    const Icon(
                      Icons.compare_arrows,
                      color: Colors.white60,
                    ),
                    rowSpace,
                    Expanded(
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
                      '(${translateFrom ?? 'Select a language'})',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white60),
                    )
                  ],
                ),
                columnSpace,
                TextFormField(
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
                      '(${translateTo ?? 'Select a language'})',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white60),
                    )
                  ],
                ),
                columnSpace,
                TextFormField(
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
}
