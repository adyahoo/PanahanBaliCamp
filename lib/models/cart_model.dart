part of 'models.dart';

class Cart extends Equatable {
  final int? id;
  final ArcherModel? archer;
  final int? qty;
  final int? total;
  final UserModel? user;

  Cart({this.id, this.archer, this.qty, this.total, this.user});

  @override
  List<Object?> get props => [id, archer, qty, total, user];
}

List<Cart> mockCarts = [
  Cart(id: 1, archer: mockArchers[0], qty: 3, total: (mockArchers[0].price! * 3), user: mockUsers[0]),
  // Cart(2, mockArchers[1], 20, (mockArchers[1].price * 20), mockUsers[0]),
  // Cart(3, mockArchers[1], 15, (mockArchers[1].price * 15), mockUsers[0]),
  // Cart(4, mockArchers[1], 20, (mockArchers[1].price * 3), mockUsers[0]),
  // Cart(5, mockArchers[1], 20, (mockArchers[1].price * 3), mockUsers[0]),
  // Cart(6, mockArchers[1], 20, (mockArchers[1].price * 3), mockUsers[0]),
  // Cart(7, mockArchers[1], 20, (mockArchers[1].price * 3), mockUsers[0]),
  // Cart(8, mockArchers[1], 20, (mockArchers[1].price * 3), mockUsers[0]),
  // Cart(9, mockArchers[1], 20, (mockArchers[1].price * 3), mockUsers[0]),
];