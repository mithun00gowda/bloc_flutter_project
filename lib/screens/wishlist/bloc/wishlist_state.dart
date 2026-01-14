part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState{
  final List<HomeProductData> wishList;

  WishlistSuccessState({required this.wishList});
}
