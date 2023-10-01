
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context){
    return SliverAppBar(
      title: const Text('List Product'),
      floating: true,
      actions: [
        IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/cart'),
            icon: const Icon(Icons.shopping_cart)
        )
      ]
    );
  }
}