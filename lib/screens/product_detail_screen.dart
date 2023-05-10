import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/widget/page_wrapper.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/controller/product_controller.dart';

final ProductController controller = Get.put(ProductController());

class ProductDetailScreen extends StatelessWidget {
    final Product product;
    const ProductDetailScreen(this.product, {Key? key}) : super(key: key);

    PreferredSizeWidget _appBar(BuildContext context){
       return AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
             onPressed: () => Navigator.pop(context),
             icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
       );
    }
  
   Widget productPageView(double width, double height) {
      return Container(
         height: height * 0.42,
         width: width,
         decoration: const BoxDecoration(
           color: Color(0xFFE5E6E8),
           borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(200),
              bottomLeft: Radius.circular(200),
           )
         ),
         child: Image.asset(
           product.image,
         )
      );
    }
  
   @override
    Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      return SafeArea(
       child: Scaffold(
         extendBodyBehindAppBar: true,
         appBar: _appBar(context),
         body: SingleChildScrollView(
           child: PageWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 productPageView(width, height),
                 const SizedBox(height: 30),
                 Text(
                   product.name,
                   style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                   ),
                 ),
                 const SizedBox(height: 20),
                 Row(
                   children: [
                     Text(
                       '\$${product.price}'
                     )
                   ]
                 ),
                 const SizedBox(height: 30),
                 Text(
                   'About'
                 ),
                 const SizedBox(height: 10),
                 Text(product.about),
                 const SizedBox(height: 20),
                 SizedBox(
                   width: 400,
                   child: ElevatedButton(
                     onPressed: () => controller.addToCart(product),
                     child: const Text('Add to cart'),
                     style: ElevatedButton.styleFrom(
                       primary: Colors.lightGreen.shade900,
                     )
                   )
                 )
               ]
             )
           )
         )
       )
     );
   }
 }
