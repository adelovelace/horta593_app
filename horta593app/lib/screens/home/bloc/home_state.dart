part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
  @override
  List<Object> get props => [];
}

class HomeErrorFetchState extends HomeState {
  final String errorMessage;
  const HomeErrorFetchState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [];
}

class HomeSuccessFetchDataState extends HomeState {
  final List<Product> items;
  const HomeSuccessFetchDataState({
    required this.items,
  });
  @override
  List<Object> get props => items;
}
