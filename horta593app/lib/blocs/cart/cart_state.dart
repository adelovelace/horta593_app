part of 'cart_bloc.dart';

abstract class CartState {
  final List<Product> productos;

  CartState({this.productos = const []});
}

class CartEmpty extends CartState {
  CartEmpty() : super(productos: []);
}

class CartLoaded extends CartState {
  final List<Product> nuevosProductos;
  CartLoaded(this.nuevosProductos) : super(productos: nuevosProductos);
}
