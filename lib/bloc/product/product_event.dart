// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

 class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class AddProduct extends ProductEvent {
  final Product product;
  const AddProduct({
    required this.product,
  });
  @override
  List<Object> get props => [product];
}


class UpdateProduct extends ProductEvent {
  final Product product;
  const UpdateProduct({
    required this.product,
  });
  @override
  List<Object> get props => [product];
}
class DeleteProduct extends ProductEvent {
  final Product product;
  const DeleteProduct({
    required this.product,
  });
  @override
  List<Object> get props => [product];
}


class RemoveProduct extends ProductEvent {
  final Product product;
  const RemoveProduct({
    required this.product,
  });
  @override
  List<Object> get props => [product];
}
