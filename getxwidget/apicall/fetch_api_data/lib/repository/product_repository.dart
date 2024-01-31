import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product.dart';

class ProductRepository {
  static var client = http.Client();

  //Product List 조회
  static Future<List<Product>> fetchProducts() async {
    try {
      var response = await client.get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));

      if (response.statusCode == 200) {
        var jsonData = response.body;

        var result = jsonDecode(jsonData)
            .map<Product>((prod) => Product.fromJson(prod))
            .toList();
        return result;

        // return productFromJson(jsonData);
      } else {
        throw Exception('Product Not Found');
      }
    } catch (e) {
      rethrow;
    } finally {}
  }
}

// //GetConnect 사용 시
// import 'package:get/get.dart';
// import '../model/product.dart';
//
// class ProductRepository extends GetConnect {
//   static ProductRepository get to => Get.find();
//
//   @override
//   void onInit() {
//     super.onInit();
//     httpClient.baseUrl = 'https://makeup-api.herokuapp.com';
//   }
//
//   //Product List 조회
//   Future<List<Product>> fetchProducts() async {
//     String url = '/api/v1/products.json?brand=marienatie';
//
//     try {
//       var response = await get(url);
//
//       if (response.statusCode == 200) {
//         var jsonData = response.body;
//
//         //GetConnect 사용시 jsonDecode 불필요
//         var result =
//             jsonData.map<Product>((prod) => Product.fromJson(prod)).toList();
//
//         return result;
//       } else {
//         return Future.error(response.statusText!);
//         // throw Exception('Product Not Found');
//       }
//     } catch (e) {
//       rethrow;
//     } finally {}
//   }
// }
