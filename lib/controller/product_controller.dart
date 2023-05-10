import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ecommerce/core/app_data.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/model/product_category.dart';

class ProductController extends GetxController {
  List<Product> allProducts = AppData.products;
  RxList<Product> filteredProducts = AppData.products.obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<ProductCategory> categories = AppData.categories.obs;
  RxInt totalPrice = 0.obs;
  
  void filterItemsByCategory(int index) {
    for(ProductCategory element in categories){
       element.isSelected = false;
    }
    categories[index].isSelected = true;
    
    if (categories[index].type == ProductType.all) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(allProducts.where((item) {
        return item.type == categories[index].type;
      }).toList());
    }
    update();
  }
  
  void isFavorite(int index){
     filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;
     update();
  }
  
  void addToCart(Product product) {
     product.quantity++;
     cartProducts.add(product);
     cartProducts.assignAll(cartProducts);
     calculateTotalPrice();
   }

   void increaseItemQuantity(Product product){
      product.quantity++;
      calculateTotalPrice();
      update();
   }
  
  void decreaseItemQuantity(Product product) {
     product.quantity--;
     calculateTotalPrice();
     update();
  }

  getCartItems() {
    cartProducts.assignAll(
      allProducts.where((item) => item.quantity > 0),
    );
  }
  
  getAllItems(){
     filteredProducts.assignAll(allProducts);
   }

  getFavoriteItems() {
    filteredProducts.assignAll(
      allProducts.where((item) => item.isFavorite),
    );
  }
  
  void calculateTotalPrice(){
      totalPrice.value = 0;
       for(var element in cartProducts){
          totalPrice.value += element.quantity * element.price;
       }
   }
}
