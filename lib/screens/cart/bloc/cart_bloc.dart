import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_flutter_project/constants/cart_items.dart';
import 'package:bloc_flutter_project/modules/home_product_data.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartIntialEvent>(cartIntialEvent);
    on<CartRemoveItemEvent>(cartRemoveEvent);
  }

  FutureOr<void> cartIntialEvent(
    CartIntialEvent event,
    Emitter<CartState> emit,
  ) {
    if (CartItems.cartItems.isEmpty) {
      emit(CartEmptyState());
    }
    emit(CartSuccessState(cartItems: CartItems.cartItems));
  }

  FutureOr<void> cartRemoveEvent(
    CartRemoveItemEvent event,
    Emitter<CartState> emit,
  )  {
    CartItems.cartItems.removeWhere(
      (element) => event.clickedItem.id == element.id,
    );
    emit(CartItemRemoveState());
    emit(CartSuccessState(cartItems: CartItems.cartItems));
  }
}
