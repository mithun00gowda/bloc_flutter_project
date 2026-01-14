import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_flutter_project/constants/cart_items.dart';
import 'package:bloc_flutter_project/constants/grocery_list.dart';
import 'package:bloc_flutter_project/constants/wishlist_items.dart';
import 'package:bloc_flutter_project/modules/home_product_data.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitalEvent>(homeInitalEvent);
    on<HomeProductWishListButtonClickedEvent>(
      homeProductWishListButtonClickedEvent,
    );
    on<HomeProductWishCartButtonClickedEvent>(
      homeProductWishCartButtonClickedEvent,
    );
    on<HomeWishlistsButtonNavigateClickedEvent>(
      homeWishlistsButtonNavigateClickedEvent,
    );
    on<HomeCartButtonNavigateClickEvent>(homeCartButtonNavigateClickEvent);
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
    HomeProductWishListButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('wishlist clicked');
    WishlistItems.wishlistItems.add(event.clickedProduct);
    emit(HomeProductWishListedActionState());
    print(WishlistItems.wishlistItems.length);
  }

  FutureOr<void> homeProductWishCartButtonClickedEvent(
    HomeProductWishCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('cart clicked');
    CartItems.cartItems.add(event.clickedProduct);
    emit(HomeProductCartListedActionState());
    print(CartItems.cartItems.length);
  }

  FutureOr<void> homeWishlistsButtonNavigateClickedEvent(
    HomeWishlistsButtonNavigateClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('wish list navigation button is clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateClickEvent(
    HomeCartButtonNavigateClickEvent event,
    Emitter<HomeState> emit,
  ) {
    print('cart navigation button is clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeInitalEvent(
    HomeInitalEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryList.groceryItems
            .map(
              (e) => HomeProductData(
                id: e['id'],
                product_name: e['product_name'],
                category: e['category'],
                price: e['price'],
                image_url: e['image_url'],
                currency: e['currency'],
                quantity: e['quantity'],
                unit: e['unit'],
                in_stock: e['in_stock'],
              ),
            )
            .toList(),
      ),
    );
  }
}
