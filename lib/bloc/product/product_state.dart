// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.removedProducts = const <Product>[],
    this.pendingProducts = const <Product>[],
    this.completedProducts = const <Product>[],
    this.outofStockProducts = const <Product>[],
  });

  final List<Product> removedProducts;
  final List<Product> pendingProducts;
  final List<Product> completedProducts;
  final List<Product> outofStockProducts;

  @override
  List<Object> get props => [
        removedProducts,
        outofStockProducts,
        completedProducts,
        pendingProducts,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingProducts': pendingProducts.map((x) => x.toMap()).toList(),
      'completedProducts': completedProducts.map((x) => x.toMap()).toList(),
      'outofStockProducts': outofStockProducts.map((x) => x.toMap()).toList(),
      'removedProducts': removedProducts.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductState.fromMap(Map<String, dynamic> map) {
    return ProductState(
      pendingProducts: List<Product>.from(
        (map['pendingProducts'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedProducts: List<Product>.from(
        (map['removedProducts'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      completedProducts: List<Product>.from(
        (map['completedProducts'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      outofStockProducts: List<Product>.from(
        (map['outofStockProducts'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
