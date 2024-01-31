import 'package:fetch_api_data/components/product_info.dart';
import 'package:fetch_api_data/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends GetView<ProductController> {
  ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Obx(
        () => controller.isLoading == true
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final product = controller.productList[index];

                  return ProductInfo(product);
                }),
      ),
    );
  }
}
