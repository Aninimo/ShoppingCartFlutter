import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/core/app_data.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/widget/product_grid_view.dart';
import 'package:ecommerce/widget/list_item_selector.dart';

enum AppbarActionType { leading, trailing }

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  
  Widget appBarActionButton(AppbarActionType type) {
     IconData icon = Icons.ac_unit_outlined;
     if(type == AppbarActionType.trailing){
       icon = Icons.search;
     }

     return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey.shade100,
        ),
        child: IconButton(
           onPressed: () {},
           icon: Icon(icon, color: Colors.black),
        )
     );
   }
  
  @override
   PreferredSize get _appBar{
     return PreferredSize(
       preferredSize: const Size.fromHeight(100),
       child: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               ClipRRect(
                 borderRadius: BorderRadius.circular(50.0),
                 child: Image(
                   image: NetworkImage('https://github.com/Aninimo.png'),
                  )
               ),    
               appBarActionButton(AppbarActionType.trailing),
             ]
           )
         )
       )
     );
   }
  
    Widget _topCategoriesHeader(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories'
            ),
          ]
        )
      );
   }
  
  Widget _topCategoriesListView() {
    return ListItemSelector(
      categories: controller.categories,
      onItemPressed: (index) {
        controller.filterItemsByCategory(index);
      },
    );
  }
  
  Widget build(BuildContext context) {
     controller.getAllItems();
     return Scaffold(
       extendBodyBehindAppBar: true,
       appBar: _appBar,
       body: SafeArea(
         child: SingleChildScrollView(
          child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    'Hello',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0
                     ),
                  ),                
                  _topCategoriesHeader(context),
                  _topCategoriesListView(),
                  GetBuilder(builder: (ProductController controller) {
                      return ProductGridView(
                         items: controller.filteredProducts,
                         likeButtonPressed: (index) => controller.isFavorite(index),
                      );
                  }),
                ]
             )
          )
         )
       )
     );
   }
}
