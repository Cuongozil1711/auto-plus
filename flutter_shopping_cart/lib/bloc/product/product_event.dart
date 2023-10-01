part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

  final class ProductStarted extends ProductEvent {
  @override
  List<Object> get props => [];
}
