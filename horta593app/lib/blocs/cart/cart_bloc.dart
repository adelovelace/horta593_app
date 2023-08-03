import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:horta593app/model/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartEmpty()) {
    on<AddProduct>((event, emit) {
      //Validar
      List<Product> newList = [...state.productos, event.product];
      emit(CartLoaded(newList));
    });

    on<RemoveProduct>((event, emit) {
      List<Product> updateProductos = state.productos
          .where((element) => element.idProduct != event.product.idProduct)
          .toList();
      emit(CartLoaded(updateProductos));
    });
  }
}
