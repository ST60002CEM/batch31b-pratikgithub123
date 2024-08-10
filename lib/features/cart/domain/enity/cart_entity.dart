class CartEntity {
  final String? id;
  final String userId;
  final List<CartItemEntity> items;

  CartEntity({
    this.id,
    required this.userId,
    required this.items,
  });
}

class CartItemEntity {
  final String productId;
  final int quantity;

  CartItemEntity({
    required this.productId,
    required this.quantity,
  });
}
