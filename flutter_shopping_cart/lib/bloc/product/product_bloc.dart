import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/data/repositories/product_repository.dart';

import '../../data/model/product.dart';
part 'product_event.dart';
part 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.productRepository}) : super(ProductLoading()) {
    on<ProductStarted>(_onStarted);
  }
  final ProductRepository productRepository;

  Future<void> _onStarted(
      ProductStarted event,
      Emitter<ProductState> emit,
  ) async {
    print(19);
    emit(ProductLoading());
    try {
      final _products = await productRepository.loadProduct();
      emit(ProductLoadData(products: _products));
    }
    catch(_) {
      emit(ProductError());
    }
  }
}