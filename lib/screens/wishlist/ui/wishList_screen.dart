import 'package:bloc_flutter_project/widgets/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wish Lists')),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous,current) => current is WishlistState,
        buildWhen: (previous,current) => current is !WishlistState,
        builder: (context, state) {
          switch (state.runtimeType){
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishList.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                    wishlistBloc: wishlistBloc,
                    productData: successState.wishList[index],
                  );
                },
              );
          }
          return Center(child: Text('WishList Screen'));
        },
      ),
    );
  }
}
