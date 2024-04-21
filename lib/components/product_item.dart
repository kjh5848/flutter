
import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe01/components/product_detail.dart';

import '../model/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              product.urlToImage,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          ProductDetail(product: product)
        ],
      ),
    );
  }
}
