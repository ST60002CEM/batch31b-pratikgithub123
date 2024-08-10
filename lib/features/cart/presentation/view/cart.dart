class Cart {
  final List<CartItem> items;
  final double totalPrice;

  Cart({required this.items, required this.totalPrice});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      totalPrice: json['totalPrice'].toDouble(),
    );
  }
}

class CartItem {
  final String productId;
  final int quantity;

  CartItem({required this.productId, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
