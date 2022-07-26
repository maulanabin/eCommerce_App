import 'dart:io';

class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  String get displayName => '($initial)${name.substring(1)}: \$$price';
  String get initial => name.substring(0, 1);
}

class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  double get price => quantity * product.price;
}

class Cart {
  
}
const allProducts = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'bananas', price: 0.70),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.00),
  Product(id: 5, name: 'mushrooms', price: 0.80),
  Product(id: 6, name: 'potatoes', price: 1.50),
];
// loop
// prompt: view cart / add item / checkout
// if selection == add item
//    choose a product
//    add it to the cart
//    print cart
//  else if selection == view cart
//    print cart
//  else if selection == checkout
//    do checkout
//    exit
//  end
void main() {
  while (true) {
    stdout.write(
      'What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
    final line = stdin.readLineSync();
    if (line == 'a') {
      final product = chooseProduct();
      if (product != null) {
        print(product.displayName);
      }
    } else if (line == 'v') {
      // TODO: IMPLEMENT
    } else if (line == 'c') {
      // TODO: IMPLEMENT
    }
  }
}

Product? chooseProduct() {
  final productsList = 
      allProducts.map((product) => product.displayName).join('\n');
  stdout.write('Available products:\n$productsList\nYour choice: ');
  final line = stdin.readLineSync();

  for (var product in allProducts) {
    if (product.initial == line) {
      return product;
    } 
  }
  print('Not found');
  return null;
}