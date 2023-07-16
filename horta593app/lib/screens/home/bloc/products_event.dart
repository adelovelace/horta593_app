part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class LoadProductMenu extends ProductsEvent {}

class AddProductMenu extends ProductsEvent {
  final Product product;
  const AddProductMenu(this.product);
  @override
  List<Object> get props => [product];
}
