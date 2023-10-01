import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/data/model/cart.dart';
import 'package:meta/meta.dart';

@immutable
sealed class CartState extends Equatable {
  const CartState();
}

final class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

final class CartLoaded extends CartState {
  const CartLoaded({this.cart = const Cart()});

  final Cart cart;

  @override
  List<Object> get props => [cart];
}

final class CartError extends CartState {
  @override
  List<Object> get props => [];
}
