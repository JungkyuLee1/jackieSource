import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCallController extends GetxController {
  var hasCallSupport = false.obs;

  void makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);

    // await canLaunchUrl(Uri(scheme: 'tel', path: '123456789'))
    //     .then((value) => print('value: ${value}'));

    await launchUrl(launchUri);




    // await canLaunchUrl(launchUri).then((result) async{
    //   print('result : $result');
    //
    //   if(result){
    //     await launchUrl(launchUri);
    //   }else{
    //     print("Can't make a call");
    //   }
    // });
  }
}
