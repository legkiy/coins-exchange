// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'coins_list_bloc.dart';

class CoinsListState {}

class CoinsListInitialState extends CoinsListState {}

class CoinsListLoadingState extends CoinsListState {}

class CoinsListLoadedState extends CoinsListState {
  CoinsListLoadedState({
    required this.coinsList,
  });
  final List<CryptoCoinModel> coinsList;
}

class CoinsListLoadingFailureState extends CoinsListState {
  final Object? exception;
  
  CoinsListLoadingFailureState({
    this.exception,
  });
}
