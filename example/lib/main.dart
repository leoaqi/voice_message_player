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
  late VoiceController voiceController2;
  VoiceController? activeVoice;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    voiceController2 = VoiceController(
      cacheKey: '1',
      audioSrc: 'https://getsamplefiles.com/download/m4a/sample-3.m4a',
      maxDuration: const Duration(minutes: 10),
      isFile: false,
      onComplete: () {
        /// do something on complete
        setState(() {
          activeVoice = null;
        });
        print('LL :: on complate 2');
      },
      onPause: () {
        /// do something on pause
      },
      onPlaying: () {
        /// do something on playing
        print('LL :: on play 2');
        if (activeVoice != null) {
          activeVoice?.pausePlaying();
        }

        setState(() {
          activeVoice = voiceController2;
        });
      },
      onError: (err) {
        /// do somethin on error
      },
    );
    voiceController1 = VoiceController(
      cacheKey: '1',
      audioSrc: 'https://getsamplefiles.com/download/m4a/sample-3.m4a',
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
        /// do somethin on error
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: VoiceMessageView(
                          controller: voiceController2,
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
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
