enum ProductType { all, cappuccino, tea, latte, chocolate }

class Product {
  String name;
  String image;
  String about;
  int price;
  bool isFavorite;
  ProductType type;
  int _quantity;

  int get quantity => _quantity;
  
  set quantity(int newQuantity){
    if(newQuantity >= 0) _quantity = newQuantity;
  }

  Product({
    required this.name,
    required this.image,
    required this.about,
    required this.price,
    required this.isFavorite,
    required this.type, 
    required int quantity,
  }) : _quantity = quantity;
}
