import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/product_model.dart';
import '../menu_generator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<FetchDataEvent>(_onFetchDataEvent);
  }

  void _onFetchDataEvent(
    FetchDataEvent event,
    Emitter<HomeState> emitter,
  ) async {

    emitter(const HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    bool isSucceed = true;
    if (isSucceed) {
      List<Product> itemsMenu = MenuGenerator.getMenu();
      emitter(HomeSuccessFetchDataState(items: itemsMenu));
    } else {
      emitter(const HomeErrorFetchState(errorMessage: "nothing to show :c"));
    }
  }
}
