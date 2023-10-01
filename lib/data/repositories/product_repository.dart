import 'package:flutter/material.dart';

import 'package:flutter_shopping_cart/data/model/product.dart';

const _delay = Duration(milliseconds: 800);

class ProductRepository {
  final _product = <Product>[];

  Future<List<Product>> loadProduct() => Future.delayed(_delay, () => demoProducts);

  void addProduct(Product product) => _product.add(product);
  void removeProduct(Product product) => _product.remove(product);
}

// Our demo Products
List<Product> demoProducts = [
  Product(
    id: 1,
    images: const [
      'assets/images/ps4_console_white_1.png',
      'assets/images/ps4_console_white_2.png',
      'assets/images/ps4_console_white_3.png',
      'assets/images/ps4_console_white_4.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Wireless Controller for PS4™',
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: const [
      'assets/images/Image Popular Product 2.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Nike Sport White - Man Pant',
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: const [
      'assets/images/glap.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Gloves XC Omega - Polygon',
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: const [
      'assets/images/wireless headset.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Logitech Head',
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    'Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …';
