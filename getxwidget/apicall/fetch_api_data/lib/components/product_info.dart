import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo(this.product, {Key? key}) : super(key: key);

  final Product product;

  Widget get line => Container(
        margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
        height: 2,
        color: Colors.grey.shade200,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
              width: 150,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // child: Image.network(product.imageLink,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Mt._Kilimanjaro_12.2006.JPG/1200px-Mt._Kilimanjaro_12.2006.JPG',
                  width: 150,
                  height: 100,
                  fit: BoxFit.fill,
                  color: Colors.purple,
                  colorBlendMode: BlendMode.color,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                  ),
                  Text(
                    product.brand,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.category,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
        line,
      ],
    );
  }
}
