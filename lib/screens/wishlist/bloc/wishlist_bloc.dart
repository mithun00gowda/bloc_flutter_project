import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_flutter_project/constants/wishlist_items.dart';
import 'package:bloc_flutter_project/modules/home_product_data.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitEvent>(wishListInitEvent);
  }

  FutureOr<void> wishListInitEvent(
    WishListInitEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishlistSuccessState(wishList: WishlistItems.wishlistItems));
  }
}
