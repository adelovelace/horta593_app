import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:horta593app/model/product_model.dart';
import 'package:horta593app/model/product_model.dart';
import 'package:horta593app/model/product_model.dart';

import '../../../model/product_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<LoadProductMenu>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const ProductsLoaded(products: <Product>[]));
    });
  }
}
