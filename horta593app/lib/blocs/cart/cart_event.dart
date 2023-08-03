part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddProduct extends CartEvent {
  final Product product;

  AddProduct(this.product);
}

class RemoveProduct extends CartEvent {
  final Product product;

  RemoveProduct(this.product);
}
