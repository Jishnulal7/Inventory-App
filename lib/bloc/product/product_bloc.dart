import 'package:equatable/equatable.dart';

import 'package:inventory_app/bloc/bloc_exports.dart';
import 'package:inventory_app/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends HydratedBloc<ProductEvent, ProductState> {
  ProductBloc() : super( const ProductState()) {
    on<AddProduct>(_onAddProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<DeleteProduct>(_onDeleteProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<MarkOutofStock>(_onMarkOutofStock);
    on<EditProduct>(_onEditProduct);
    on<RestoreProduct>(_onRestoreProduct);
    on<DeleteAllProducts>(_onDeleteAllProducts);
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

  void _onMarkOutofStock(MarkOutofStock event, Emitter<ProductState> emit) {
    final state = this.state;
    List<Product> pendingProducts = state.pendingProducts;
    List<Product> completedProducts = state.completedProducts;
    List<Product> outofStockProducts = state.outofStockProducts;

    if (event.product.isDone == false) {
      if (event.product.isOutofStock == false) {
        var productIndex = pendingProducts.indexOf(event.product);
        pendingProducts = List.from(pendingProducts)
          ..remove(event.product)
          ..insert(productIndex, event.product.copyWith(isOutofStock: true));
        outofStockProducts.insert(
            0, event.product.copyWith(isOutofStock: true));
      } else {
        var productIndex = pendingProducts.indexOf(event.product);
        pendingProducts = List.from(pendingProducts)
          ..remove(event.product)
          ..insert(productIndex, event.product.copyWith(isOutofStock: false));
        outofStockProducts.remove(event.product);
      }
    } else {
      if (event.product.isOutofStock == false) {
        var productIndex = completedProducts.indexOf(event.product);
        completedProducts = List.from(completedProducts)
          ..remove(event.product)
          ..insert(productIndex, event.product.copyWith(isOutofStock: true));
        outofStockProducts.insert(
            0, event.product.copyWith(isOutofStock: true));
      } else {
        var productIndex = completedProducts.indexOf(event.product);
        completedProducts = List.from(completedProducts)
          ..remove(event.product)
          ..insert(productIndex, event.product.copyWith(isOutofStock: false));
        outofStockProducts.remove(event.product);
      }
    }
    emit(ProductState(
      pendingProducts: pendingProducts,
      completedProducts: completedProducts,
      outofStockProducts: outofStockProducts,
      removedProducts: state.removedProducts,
    ));
  }

  // void _onEditProduct(EditProduct event, Emitter<ProductState> emit) {
  //   final state = this.state;
  //   List<Product> outofStockProducts = state.outofStockProducts.toList();
  //   if (event.oldProduct.isOutofStock == true) {
  //     outofStockProducts
  //       ..remove(event.oldProduct)
  //       ..insert(0, event.newProduct);
  //   }
  //   emit(
  //     ProductState(
  //       pendingProducts: List.from(state.pendingProducts)
  //         ..remove(event.oldProduct)
  //         ..insert(0, event.newProduct),
  //       completedProducts: state.completedProducts..remove(event.oldProduct),
  //       outofStockProducts: outofStockProducts,
  //       removedProducts: state.removedProducts,
  //     ),
  //   );
  // }
void _onEditProduct(EditProduct event, Emitter<ProductState> emit) {
  final state = this.state;
  List<Product> outofStockProducts = state.outofStockProducts.toList();
  if (event.oldProduct.isOutofStock == true) {
    // Remove the old product from the list.
    outofStockProducts.remove(event.oldProduct);

    // Add the new product to the list.
    outofStockProducts.add(event.newProduct);
  }
  emit(
    ProductState(
      pendingProducts: List.from(state.pendingProducts)
        ..remove(event.oldProduct)
        ..insert(0, event.newProduct),
      completedProducts: state.completedProducts..remove(event.oldProduct),
      outofStockProducts: outofStockProducts,
      removedProducts: state.removedProducts,
    ),
  );
}
  void _onRestoreProduct(RestoreProduct event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(
      ProductState(
        removedProducts: List.from(state.removedProducts)
          ..remove(event.product),
        pendingProducts: List.from(state.pendingProducts)
          ..insert(
              0,
              event.product.copyWith(
                isDeleted: false,
                isDone: false,
                isOutofStock: false,
              )),
        completedProducts: state.completedProducts,
        outofStockProducts: state.outofStockProducts,
      ),
    );
  }

  void _onDeleteAllProducts(DeleteAllProducts event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(
      ProductState(
        removedProducts: List.from(state.removedProducts)..clear(),
        pendingProducts: state.pendingProducts,
        completedProducts: state.completedProducts,
        outofStockProducts: state.outofStockProducts,
      ),
    );
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
