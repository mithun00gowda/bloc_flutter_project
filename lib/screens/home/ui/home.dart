import 'package:bloc_flutter_project/screens/cart/ui/cart_screen.dart';
import 'package:bloc_flutter_project/screens/wishlist/ui/wishList_screen.dart';
import 'package:bloc_flutter_project/widgets/product_tile_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    homeBloc.add(HomeInitalEvent());
    super.initState();
  }
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
        listenWhen: (previous,current) => current is HomeActionState,
        buildWhen: (previous, current) => current is !HomeActionState,
      // listenWhen: (context, current) => current is HomeActionState,
      // buildWhen: (context, current) => current is! HomeActionState,
      listener: (context, state) {
        if (kDebugMode) {
          print(state is HomeNavigateToCartPageActionState);
        }
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistScreen()),
          );
        } else if (state is HomeProductCartListedActionState) {

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Item added to Cart')));
        } else if (state is HomeProductWishListedActionState) {
          print("added wishlist message");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Item added to WishList')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Grocery App'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistsButtonNavigateClickedEvent());
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateClickEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    homeBloc: HomeBloc(),
                    productData: successState.products[index],
                  );
                },
              ),
            );
          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
