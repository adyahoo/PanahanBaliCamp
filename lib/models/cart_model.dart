part of 'models.dart';

class Cart extends Equatable {
  final int? id;
  final int? userId;
  final String? itemName;
  final int? price;
  final String? itemType;
  final String? image;
  final int? qty;

  Cart({this.id, this.userId, this.itemName, this.price, this.itemType, this.image, this.qty});

  factory Cart.fromJson(Map<String, dynamic> data) => Cart(
    id: data['id'],
    userId: data['user_id'],
    itemName: data['nama_item'],
    price: data['harga_item'],
    itemType: data['jenis_item'],
    image: data['foto'],
    qty: data['qty']
  );

  @override
  List<Object?> get props => [id, userId, itemName, price, itemType, image, qty];
}

List<Cart> mockCarts = [
  Cart(id: 1, itemName: "item", userId: 4, price: 1000, itemType: "Barang", image: "image.jpg", qty: 4),
];