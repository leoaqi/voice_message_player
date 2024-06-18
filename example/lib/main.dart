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
                          controller: VoiceController(
                            cacheKey: '1',
                            audioSrc:
                                'https://dl.solahangs.com/Music/1403/02/H/128/Hiphopologist%20-%20Shakkak%20%28128%29.mp3',
                            maxDuration: const Duration(minutes: 10),
                            isFile: false,
                            onComplete: () {
                              /// do something on complete
                            },
                            onPause: () {
                              /// do something on pause
                            },
                            onPlaying: () {
                              /// do something on playing
                            },
                            onError: (err) {
                              /// do somethin on error
                            },
                          ),
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
