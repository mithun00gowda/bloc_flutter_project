part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitalEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final HomeProductData clickedProduct;

  HomeProductWishListButtonClickedEvent({required this.clickedProduct});
}

class HomeProductWishCartButtonClickedEvent extends HomeEvent {
  final HomeProductData clickedProduct;

  HomeProductWishCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistsButtonNavigateClickedEvent extends HomeEvent {}

class HomeCartButtonNavigateClickEvent extends HomeEvent {}
