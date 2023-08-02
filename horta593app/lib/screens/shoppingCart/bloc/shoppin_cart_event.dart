part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();

  @override
  List<Object> get props => [];
}

class ShoppingCartLoaded extends ShoppingCartEvent {}
