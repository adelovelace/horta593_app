part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartState extends Equatable {
  const ShoppingCartState();

  @override
  List<Object> get props => [];
}

class ShoppingCartInitial extends ShoppingCartState {}

class ShoppingCartLoad extends ShoppingCartState {
  final List<Product> products;

  const ShoppingCartLoad({required this.products});

  @override
  List<Object> get props => [products];
}
