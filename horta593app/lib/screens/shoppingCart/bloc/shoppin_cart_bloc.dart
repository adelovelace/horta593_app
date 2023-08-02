import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:horta593app/model/product_model.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(ShoppingCartInitial()) {
    on<ShoppingCartLoaded>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const ShoppingCartLoad(
          products: <Product>[])); // TODO: implement event handler
    });
  }
}
