import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coins_list_event.dart';
part 'coins_list_state.dart';

class CoinsListBloc extends Bloc<CoinsListEvent, CoinsListState> {
  CoinsListBloc(this.coinsRepository) : super(CoinsListInitialState()) {
    on<CoinsListEvent>((event, emit) async {
      try {
        final cryptoCoinsList = await coinsRepository.getCoinsList();
        emit(CoinsListLoadedState(coinsList: cryptoCoinsList));
      } catch (error) {
        emit(CoinsListLoadingFailureState(exception: error));
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
