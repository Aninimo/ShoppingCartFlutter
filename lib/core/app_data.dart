import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerce/model/bottom_navy_bar_item.dart';

import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/model/product_category.dart';
import 'package:ecommerce/model/recommended_product.dart';

class AppData {
  const AppData._();
  static String dummyText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      ' industry. Lorem Ipsum has been the industry\'s standard dummy text'
      ' ever since the 1500s, when an unknown printer took a galley of type'
      ' and scrambled it to make a type specimen book.';
  
  static List<Product> products = [
    Product(
       name: 'Cappuccino',
       image: 'assets/images/cappuccin.png',
       price: 5,
       about: dummyText,
       isFavorite: true,
       type: ProductType.cappuccino,
       quantity: 0,
     ),
     Product(
       name: 'Latte Macchiato',
       image: 'assets/images/macchiato.webp',
       isFavorite: false,
       price: 15,
       about: dummyText,
       type: ProductType.latte,
       quantity: 0,
     ),
     Product(
       name: 'Chococino',
       image: 'assets/images/chocolate.webp',
       price: 13,
       about: dummyText,
       isFavorite: false,
       type: ProductType.chocolate,
       quantity: 0,
     ),
     Product(
       name: 'Hibiscus',
       image: 'assets/images/cha.webp',
       price: 19,
       about: dummyText,
       isFavorite: false,
       type: ProductType.tea,
       quantity: 0,
     )
  ];
  static List<ProductCategory> categories = [
    ProductCategory(
      ProductType.all,
      true,
      Icons.all_inclusive,
    ),
    ProductCategory(
      ProductType.cappuccino,
      false,
      Icons.coffee
    ),
    ProductCategory(
       ProductType.tea,
       false,
       Icons.emoji_food_beverage
    ),
    ProductCategory(
      ProductType.latte,
      false,
      Icons.coffee_maker
    ),
    ProductCategory(
      ProductType.chocolate,
      false,
      Icons.local_cafe
    )
  ];
  static List<BottomNavyBarItem> bottomNavyBarItems = [
     BottomNavyBarItem(
      'Home',
       const Icon(Icons.home),
       const Color(0xFFE33691E),
       Colors.grey,
      ),
      BottomNavyBarItem(
        'Favorite',
         const Icon(Icons.favorite),
         const Color(0xFF33691E),
         Colors.grey,
       ),
       BottomNavyBarItem(
         'Cart',
          const Icon(Icons.shopping_cart),
          const Color(0xFF33691E),
          Colors.grey,
       ),
       BottomNavyBarItem(
         'Profile',
          const Icon(Icons.person),
          const Color(0xFF33691E),
          Colors.grey,
       )
   ];
}
