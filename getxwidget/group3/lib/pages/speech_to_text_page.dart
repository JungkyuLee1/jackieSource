import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group3_features/controllers/speech_to_text_controller.dart';

class SpeechTextPage extends GetView<SpeechTextController> {
  const SpeechTextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech To Text'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    controller.speechText.value,
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AvatarGlow(
              animate: controller.isListening.value,
              glowColor: Colors.blue,
              endRadius: 90,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              repeatPauseDuration: Duration(milliseconds: 100),
              child: FloatingActionButton(
                onPressed: () {
                  controller.listen();
                },
                child: Icon(
                    controller.isListening.value ? Icons.mic : Icons.mic_none),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                controller.reset();
              },
              child: Text('Reset'),
              backgroundColor: Colors.grey[600],
            ),
            FloatingActionButton(
              onPressed: () {
                controller.copyTextToClipboard();
              },
              child: Text('Copy'),
              backgroundColor: Colors.grey[600],
            )
          ],
        ),
      ),
    );
  }
}
