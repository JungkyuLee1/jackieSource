import 'package:uuid/uuid.dart';

class DataUtil {
  //파일명 부여
  static String makeFilePath(String rawFileName) {
    var fileExt = rawFileName.split('.').last;
    return '${Uuid().v4()}.${fileExt}';
  }
}
