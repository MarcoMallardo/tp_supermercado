class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

class Product {
  //Atributos:
  String name;
  double price;
  String description;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
  });
}

class CalcData {
  final Product mostExpensive;
  final Product cheapest;
  final Product largestQuantity;
  final Product smallestQuantity;
  final double averagePrice;

  CalcData({
    required this.mostExpensive,
    required this.cheapest,
    required this.largestQuantity,
    required this.smallestQuantity,
    required this.averagePrice,
  });

  bool get hasProducts => true;
}
