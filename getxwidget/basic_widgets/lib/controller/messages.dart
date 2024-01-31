import 'package:get/get.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': 'Hello'},
        'ko_KO': {'hello': '헬로우'},
        'fr_FR': {'hello': 'Bonjour'}
      };
}
