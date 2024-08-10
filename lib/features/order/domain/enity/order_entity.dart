import 'package:equatable/equatable.dart';

class OrderItemEntity extends Equatable {
  final String productId;
  final int quantity;

  const OrderItemEntity({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity];
}

class OrderEntity extends Equatable {
  final String? id;
  final String userId;
  final List<OrderItemEntity> items;
  final double totalPrice;
  final String phoneNumber;
  final String location;

  const OrderEntity({
    this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.phoneNumber,
    required this.location,
  });

  @override
  List<Object?> get props => [id, userId, items, totalPrice, phoneNumber, location];
}
