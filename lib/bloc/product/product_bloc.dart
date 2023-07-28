import 'package:equatable/equatable.dart';

import 'package:inventory_app/bloc/bloc_exports.dart';
import 'package:inventory_app/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends HydratedBloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<AddProduct>(_onAddProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<DeleteProduct>(_onDeleteProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onAddProduct(AddProduct event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(ProductState(
        pendingProducts: List.from(state.pendingProducts)..add(event.product),
        completedProducts: state.completedProducts,
        outofStockProducts: state.outofStockProducts,
        removedProducts: state.removedProducts));
  }

  void _onUpdateProduct(UpdateProduct event, Emitter<ProductState> emit) {
    final state = this.state;
    final product = event.product;

    List<Product> pendingProducts = state.pendingProducts;
    List<Product> completedProducts = state.completedProducts;

    product.isDone == false
        ? {
            pendingProducts = List.from(pendingProducts)..remove(product),
            completedProducts = List.from(completedProducts)
              ..insert(0, product.copyWith(isDone: true))
          }
        : {
            completedProducts = List.from(completedProducts)..remove(product),
            pendingProducts = List.from(pendingProducts)
              ..insert(0, product.copyWith(isDone: false))
          };

    emit(
      ProductState(
          pendingProducts: pendingProducts,
          removedProducts: state.removedProducts,
          outofStockProducts: state.outofStockProducts,
          completedProducts: completedProducts),
    );
  }

  void _onDeleteProduct(DeleteProduct event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(
      ProductState(
        pendingProducts: state.pendingProducts,
        completedProducts: state.completedProducts,
        outofStockProducts: state.outofStockProducts,
        removedProducts: List.from(state.removedProducts)
          ..remove(event.product),
      ),
    );
  }

  void _onRemoveProduct(RemoveProduct event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(ProductState(
        removedProducts: List.from(state.removedProducts)
          ..add(event.product.copyWith(isDeleted: true)),
        completedProducts: List.from(state.completedProducts)
          ..remove(event.product),
        pendingProducts: List.from(state.pendingProducts)
          ..remove(event.product),
        outofStockProducts: List.from(state.outofStockProducts)
          ..remove(event.product)));
  }

  @override
  ProductState? fromJson(Map<String, dynamic> json) {
    return ProductState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ProductState state) {
    return state.toMap();
  }
}
