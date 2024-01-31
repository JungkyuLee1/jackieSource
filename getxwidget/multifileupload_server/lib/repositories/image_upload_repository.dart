import 'dart:io';
import 'package:get/get.dart';
import '../api/api.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as path;

class ImageUploadRepository extends GetConnect {
  static ImageUploadRepository get to =>Get.find();
  var rtnMsg;
  List<File>? files=[];

  @override
  void onInit() {
    super.onInit();
    // httpClient.baseUrl = Api.baseUrl;
  }

  Future<String> uploadImage(List<String> imageList) async{
    var url=Uri.parse(Api.baseUrl+'/fileUpload/api/imageUpload');
    var request = http.MultipartRequest('POST', url);

    files=[];
    for (String path in imageList) {
         files?.add(File(path));
    }

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'connection': 'keep-alive',
      'accept': "*/*",
      // 'Accept-Encoding' : 'gzip, deflate, br'
    };
    request.headers.addAll(headers);

    //add check
    if (files == null || files!.isEmpty) {
      print('files is null/empty');
    } else {
      print('fileSize : ${files![0].lengthSync()}');
    }

    for (int i = 0; i < files!.length; i++) {
      var stream =
      new http.ByteStream(DelegatingStream.typed(files![i].openRead()));

      String filePath = files![i].path;

      String basename = path.basename(
          filePath.substring(0, filePath.lastIndexOf(".") + 1) +
              getMimeType(filePath));

      var length = files![i].lengthSync();
      final multipartFiles =
      new http.MultipartFile('files', stream, length, filename: basename);

      request.files.add(multipartFiles);
    }


    //jsonEncode를 위하여 User model에 toJson() 생성해 두어야 함
    // String jsonStringSet = jsonEncode(newUser);
    // request.fields['jsonString'] = jsonStringSet;

    // print('request.fields : ${request.fields}');
    var response;
    try {
         response = await request.send();
    }catch(e){
      print('error : ${e.toString()}');
    }

    print('response : ${response}');
    var result = await response.stream.bytesToString();
    print('result : $result');
    print('statusCode : ${response.statusCode}');

    if (response.statusCode == 200) {
      print('save success');
      return 'success';
    } else {
      print('save failed');
      return 'fail';
    }

  }

  String getMimeType(String path) {
    String extension = path.substring(path.lastIndexOf(".") + 1);
    return extension.toLowerCase();
  }

//   Future<String> uploadImage(List<String> imageList) async {
//     try {
//       final form = FormData({});
//
//       for (String path in imageList) {
//         // print('file : ${path}');
//         // print('file1 : ${DateTime.now().microsecondsSinceEpoch}.${path.split('.').last}');
//
//         form.files.add(MapEntry(
//             'files',
//             MultipartFile(File(path),
//                 filename:
//                     '${DateTime.now().microsecondsSinceEpoch}.${path.split('.').last}')));
//       }
//
//       final response = await post("/fileUpload/api/imageUpload", form);
//
//       print('response : ${response.bodyString}');
//       print('response1 :${response.statusText}');
//
//       if(response.status.hasError){
//         print('error : ${response.statusText!}');
//         return Future.error(response.statusText!);
//       }else{
//         final result = response.body;
//
//         if(result !=null){
//           rtnMsg='success';
//         }else{
//           rtnMsg='fail';
//         }
//       }
//       return rtnMsg;
//     } catch (e) {
//       return Future.error(e.toString());
//     }
//   }
// }
}