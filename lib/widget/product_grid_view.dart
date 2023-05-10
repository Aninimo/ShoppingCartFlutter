import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/animation/open_container_wrapper.dart';

class ProductGridView extends StatelessWidget {   
  const ProductGridView({
     Key? key,
     required this.items,
     required this.likeButtonPressed,
  }) : super(key: key);
  
  final List<Product> items;
  final void Function(int index) likeButtonPressed;
  
  Widget _gridItemHeader(Product product, int index){
    return Padding(
       padding: const EdgeInsets.all(10.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           IconButton(
              icon: Icon(
                Icons.favorite,  
                 color: items[index].isFavorite
                  ? Colors.redAccent
                  : const Color(0xFFA6A3A0)
               ),
               onPressed: () => likeButtonPressed(index),
             )
         ]
       )
    );
}
  
Widget _gridItemBody(Product product) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 50),
      child: Image.asset(
          product.image,
          width: 50
      )
    );  
 }
  
 Widget _gridItemFooter(Product product, BuildContext context) {
    return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
         padding: const EdgeInsets.all(10),
         height: 80,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                product.name,
              )
            ),
            Row(
              children: [
                Text(
                  '\$${product.price}'
                ),
                SizedBox(width: 50),
                CircleAvatar(
                  radius: 20,
                    backgroundColor: Colors.green.shade900,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                          color: Colors.white,
                      ),
                      onPressed: () => {},
                    ),
                )
              ]
            )
          ]
         )
       )
    );
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           childAspectRatio: 10 / 16,
           crossAxisCount: 2,
           mainAxisSpacing: 10,
           crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          Product product = items[index];
          return OpenContainerWrapper(
            product: product,
            child: GridTile(
              header: _gridItemHeader(product, index),
              child: _gridItemBody(product),
              footer: _gridItemFooter(product, context),
            )
          );
        }
      )
    );
  }
}
