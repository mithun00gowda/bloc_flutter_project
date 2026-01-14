part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{

}
class HomeLoadedSuccessState extends HomeState{
 final List<HomeProductData> products;

  HomeLoadedSuccessState({required this.products});
}
class HomeErrorState extends HomeState{

}

class HomeNavigateToWishlistPageActionState extends HomeActionState{}
class HomeNavigateToCartPageActionState extends HomeActionState{}

class HomeProductWishListedActionState extends HomeActionState{}
class HomeProductCartListedActionState extends HomeActionState{}