import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/widget/product_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    controller.getFavoriteItems();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder(
          builder: (ProductController controller) {
            return ProductGridView(
              items: controller.filteredProducts,
              likeButtonPressed: (index) => controller.isFavorite(index),
            );
          },
        ),
      ),
    );
  }
}
