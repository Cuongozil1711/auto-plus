import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/data/model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1, child: ColoredBox(color: product.colors[0])),
            const SizedBox(width: 24),
            Expanded(child: Text(product.title, style: textTheme)),
            const SizedBox(width: 24)
          ],
        ),
      ),
    );
  }
}