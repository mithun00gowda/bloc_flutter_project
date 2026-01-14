part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<HomeProductData> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartItemRemoveState extends CartState {}

class CartEmptyState extends CartState {}
