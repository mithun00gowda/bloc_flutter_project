import 'package:bloc_flutter_project/constants/cart_items.dart';
import 'package:bloc_flutter_project/screens/cart/bloc/cart_bloc.dart';
import 'package:bloc_flutter_project/widgets/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/cart_items.dart';
import '../../../widgets/product_tile_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartIntialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Screen')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,

        listener: (context, state)  async {
          print(state);
          if(state is CartItemRemoveState) {
           await Fluttertoast.showToast(msg: "Item is Removed",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          print(state);
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    cartBloc: cartBloc,
                    productData: successState.cartItems[index],
                  );
                },
              );
            case CartEmptyState:
              return Container(
                child: Center(
                  child: Text('Cart is Empty'),
                ),
              );
          }
          return Container(
          child: Center(
          child: Text('Cart is Empty'),
          ),
          );
        },
      ),
    );
  }
}
