import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:voice_message_package/voice_message_package.dart';

void main() => runApp(const MyApp());

///
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  late VoiceController voiceController1;
  // late VoiceController voiceController2;
  VoiceController? activeVoice;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // voiceController2 = VoiceController(
    //   cacheKey: '2',
    //   audioSrc: 'https://getsamplefiles.com/download/m4a/sample-3.m4a',
    //   maxDuration: const Duration(minutes: 10),
    //   isFile: false,
    //   onComplete: () {
    //     /// do something on complete
    //     setState(() {
    //       activeVoice = null;
    //     });
    //     print('LL :: on complate 2');
    //   },
    //   onPause: () {
    //     /// do something on pause
    //   },
    //   onPlaying: () {
    //     /// do something on playing
    //     print('LL :: on play 2');
    //     if (activeVoice != null) {
    //       activeVoice?.pausePlaying();
    //     }

    //     setState(() {
    //       activeVoice = voiceController2;
    //     });
    //   },
    //   onError: (err) {
    //     /// do somethin on error
    //   },
    // );
    voiceController1 = VoiceController(
      cacheKey:
          'audio_1719988221910',
      audioSrc:
          'https://development-aqi.s3.ap-southeast-3.amazonaws.com/project-dssm/592/audio_1719988221910.m4a?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA2T3V6KGEWLG5KME6%2F20240703%2Fap-southeast-3%2Fs3%2Faws4_request&X-Amz-Date=20240703T081235Z&X-Amz-SignedHeaders=host&X-Amz-Expires=600&X-Amz-Signature=3b77ebc0f0931d61655c84851fe67ec06f8c4b0006775d0c0015a701cb9690cb',
      maxDuration: const Duration(minutes: 10),
      isFile: false,
      onComplete: () {
        /// do something on complete
        setState(() {
          activeVoice = null;
        });
        print('LL :: on complate 1');
      },
      onPause: () {
        /// do something on pause
      },
      onPlaying: () {
        /// do something on playing
        print('LL :: on play 1');
        if (activeVoice != null) {
          activeVoice?.pausePlaying();
        }

        setState(() {
          activeVoice = voiceController1;
        });
      },
      onError: (err) {
        print(err);
      },
    );
  }

  @override
  Widget build(BuildContext context) => Sizer(
        builder: (_, __, ___) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50.h),
                    TextFormField(
                      controller: controller,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: SizedBox(
                        width: double.infinity,
                        child: VoiceMessageView(
                          controller: voiceController1,
                          innerPadding: 12,
                          cornerRadius: 20,
                          size: 28,
                          deleteButton: const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(Icons.delete),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 18, vertical: 10),
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     child: VoiceMessageView(
                    //       controller: voiceController2,
                    //       innerPadding: 12,
                    //       cornerRadius: 20,
                    //       size: 28,
                    //       deleteButton: const Padding(
                    //         padding: EdgeInsets.only(left: 10),
                    //         child: Icon(Icons.delete),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
