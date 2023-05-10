import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/core/extensions.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/animation/animated_switcher_wrapper.dart';

final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  
  Widget cartList() {
     return SingleChildScrollView(
       child: Column(
         children: controller.cartProducts.mapWithIndex((index, _) {
           Product product = controller.cartProducts[index];
           return Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200]?.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: ClipRRect(
                        child: Padding(
                         padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            product.image,
                            width: 100,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '\$${product.price}'
                      )
                    ]
                  ),
                  Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => controller.decreaseItemQuantity(product),
                          icon: const Icon(
                            Icons.remove,
                            color: Color(0xFFEC6813),
                          ),
                        ),
                        GetBuilder<ProductController>(
                          builder: (ProductController controller) {
                           return AnimatedSwitcherWrapper(
                             child: Text(
                               '${controller.cartProducts[index].quantity}',
                               key: ValueKey<int>(
                                 controller.cartProducts[index].quantity,
                              ),
                             )
                           );
                          },
                        ),
                        IconButton(
                          onPressed: () => controller.increaseItemQuantity(product),
                          icon: const Icon(Icons.add, color: Color(0xFFEC6813)),
                        )
                      ]
                    )
                  )
                ]
              )
           );
         }).toList(),
       )
     );
   }
  
  Widget bottomBarTitle() {
     return Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:'
            ),
            Obx(
             () {
               return AnimatedSwitcherWrapper(
                 child: Text(
                   '\$${controller.totalPrice.value}',
                   key: ValueKey<int>(controller.totalPrice.value),
                 )
               );
             },
            )
          ]
        )
     );
   }
  
  Widget bottomBarButton() {
     return SizedBox(
       width: double.infinity,
       child: Padding(
         padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
         child: ElevatedButton(
           onPressed: () => {},
           style: ElevatedButton.styleFrom(
             primary: Colors.lightGreen.shade900,
           ),
           child: const Text('Buy Now')
         )
       )
     );
   }
  
  @override
   Widget build(BuildContext context) {
     controller.getCartItems(); 
     return Scaffold(
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Expanded(
             child: cartList()
           ),
           bottomBarTitle(),
           bottomBarButton()
         ]
       )
     );
   }
}
