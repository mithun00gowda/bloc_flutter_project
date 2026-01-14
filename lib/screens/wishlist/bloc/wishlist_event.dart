part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}


class WishListInitEvent extends WishlistEvent{}

class WishlistSuccessEvent extends WishlistEvent{
  final List<HomeProductData> wishListItem;

  WishlistSuccessEvent({required this.wishListItem});
}
