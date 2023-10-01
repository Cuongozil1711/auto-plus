import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/bloc/product/product_bloc.dart';
import 'package:flutter_shopping_cart/screen/product/view/product_app_bar.dart';
import 'package:flutter_shopping_cart/screen/product/view/product_item.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static String routeName = '/product_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
          const ProductAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            return switch (state) {
              ProductLoading() => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              ProductError() => const SliverFillRemaining(
                child: Text('Something went wrong!'),
            ),
              ProductLoadData() => SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) => ProductItem(state.products[index]),
                      childCount: state.products.length)
              )
            };
          },),
        ],),);
  }
}
