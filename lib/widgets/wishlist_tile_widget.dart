import 'package:bloc_flutter_project/modules/home_product_data.dart';
import 'package:bloc_flutter_project/screens/cart/bloc/cart_bloc.dart';
import 'package:bloc_flutter_project/screens/home/bloc/home_bloc.dart';
import 'package:bloc_flutter_project/screens/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WishlistTileWidget extends StatelessWidget {
  final HomeProductData productData;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget({
    super.key,
    required this.productData,
    required this.wishlistBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productData.image_url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            productData.product_name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productData.category),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                productData.price.toString() + " " + productData.currency,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print('Tested');
                      // homeBloc.add(
                      //   HomeProductWishListButtonClickedEvent(
                      //     clickedProduct: productData,
                      //   ),
                      // );
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(
                      //   HomeProductWishCartButtonClickedEvent(
                      //     clickedProduct: productData,
                      //   ),
                      // );
                      // wishlistBloc.add(CartRemoveItemEvent(clickedItem: productData
                      // )
                      // );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
