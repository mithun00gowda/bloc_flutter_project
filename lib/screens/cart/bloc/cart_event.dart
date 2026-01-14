part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}


class CartIntialEvent extends CartEvent{}
class CartRemoveItemEvent extends CartEvent{
final HomeProductData clickedItem;
  CartRemoveItemEvent({required this.clickedItem});
}

