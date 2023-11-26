import 'package:crypto_coins_list/features/coins_list/bloc/coins_list_bloc.dart';
import 'package:crypto_coins_list/features/coins_list/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CoinsListScreen extends StatefulWidget {
  const CoinsListScreen({super.key, required this.title});

  final String title;

  @override
  State<CoinsListScreen> createState() => _CoinsListScreenState();
}

class _CoinsListScreenState extends State<CoinsListScreen> {
  // List<CryptoCoinModel>? _cryptoCoinsList;

  final _coinsListBloc = CoinsListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    // _loadCoinsList();
    _coinsListBloc.add(LoadCoinsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: BlocBuilder<CoinsListBloc, CoinsListState>(
        bloc: _coinsListBloc,
        builder: (context, state) {
          if (state is CoinsListLoadedState) {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: theme.dividerColor,
              ),
              padding: const EdgeInsets.only(top: 10),
              itemCount: state.coinsList.length,
              itemBuilder: (context, index) {
                final coin = state.coinsList[index];

                return CoinsListTile(
                  coin: coin,
                );
              },
            );
          }
          if (state is CoinsListLoadingFailureState) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Loading Error'),
                  Text('Try again later'),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      // _cryptoCoinsList == null
      //     ? Center(
      //         child: CircularProgressIndicator(
      //             color: theme.floatingActionButtonTheme.backgroundColor),
      //       )
      //     : ListView.separated(
      //         separatorBuilder: (context, index) => Divider(
      //           color: theme.dividerColor,
      //         ),
      //         padding: const EdgeInsets.only(top: 10),
      //         itemCount: _cryptoCoinsList!.length,
      //         itemBuilder: (context, index) {
      //           final coin = _cryptoCoinsList![index];

      //           return CoinsListTile(
      //             coin: coin,
      //           );
      //         },
      //       ),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.refresh_outlined),
      //     onPressed: () async {
      //       await _loadCoinsList();
      //     }),
    );
  }

  // Future<void> _loadCoinsList() async {
  //   _cryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
  //   setState(() {});
  // }
}
