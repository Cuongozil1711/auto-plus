part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {}

final class ProductLoadData extends ProductState {
  final List<Product> products;

  const ProductLoadData({required this.products});

  @override
  List<Object> get props => [products];
}

final class ProductError extends ProductState {}
