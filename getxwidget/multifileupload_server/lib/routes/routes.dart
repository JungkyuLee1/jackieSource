import 'package:get/get.dart';
import 'package:multifileupload_server/bindings/file_upload_binding.dart';
import 'package:multifileupload_server/pages/file_upload_page.dart';

class Routes {
  static const INITIAL = '/fileUpload';

  static final routes = [
    GetPage(
        name: '/fileUpload',
        page: () => FileUploadPage(),
        binding: FileUploadBinding()),
  ];
}
