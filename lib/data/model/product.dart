import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable{
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  List<Object?> get props => [id, images, colors, rating, isFavourite, isPopular, title, price, description];
}

