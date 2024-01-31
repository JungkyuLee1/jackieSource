import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/sms_code_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SmsCodePage extends GetView<SmsCodeController> {
  const SmsCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto SMS Code Read'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => PinFieldAutoFill(
                textInputAction: TextInputAction.done,
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 16, color: Colors.orange),
                  colorBuilder: FixedColorBuilder(Colors.transparent),
                  bgColorBuilder:
                      FixedColorBuilder(Colors.grey.withOpacity(.2)),
                ),
                controller: controller.textEditingController,
                currentCode: controller.messageOptCode.value,
                onCodeSubmitted: (code) {},
                onCodeChanged: (code) {
                  controller.messageOptCode.value = code!;
                  controller.countdownController.pause();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Countdown(
                seconds: 15,
                interval: Duration(milliseconds: 1000),
                build: (context, currentRemainingTime) {
                  print('remainingTime : $currentRemainingTime');

                  if (currentRemainingTime == 0) {
                    return GestureDetector(
                      onTap: () {
                        Get.offAllNamed('/smsCode');
                      },
                      child: Container(
                        width: context.width,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1, color: Colors.orange),
                        ),
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      width: context.width,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1, color: Colors.orange),
                      ),
                      child: Text(
                        'Wait ${currentRemainingTime.toString().length == 4 ? currentRemainingTime.toString().substring(0, 2) : currentRemainingTime.toString().substring(0, 1)}',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
