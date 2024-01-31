import 'package:fetch_api_data/model/product.dart';
import 'package:fetch_api_data/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  RxList<Product> productList = <Product>[].obs;
  // List<Product> productList = <Product>[].obs;
  // var productList = <Product>[].obs;

  // Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;

  var isLoading=true.obs;

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  void fetchProducts() async{
    try {
      isLoading(true);
      // var products= await ProductRepository.to.fetchProducts();
      var products = await ProductRepository.fetchProducts();
      // print('product length : ${products.length}');

      if(products.length > 0) {
        productList.addAll(products);
        // productList.assignAll(products);
        print('productList  : ${productList.length}');
      }
    }catch(e){
      rethrow;
    }finally{
      isLoading(false);
    }
  }



  @override
  void onClose() {
    super.onClose();
  }
}