part of 'models.dart';

enum TransactionStatus { OnProgress, Completed, Paid }

class Transaction extends Equatable {
  final int? id;
  final List<Cart>? carts;
  final ArcherModel? archer;
  final int? qty;
  final int? total;
  final DateTime? dateTime;
  final UserModel? user;
  final TransactionStatus? status;

  Transaction({
    this.id,
    this.carts,
    this.archer,
    this.qty,
    this.total,
    this.dateTime,
    this.user,
    this.status,
  });

  Transaction copyWith(
      {int? id,
      List<Cart>? carts,
      ArcherModel? archer,
      int? qty,
      int? total,
      DateTime? dateTime,
      UserModel? user,
      TransactionStatus? status}) {
    return Transaction(
        id: id ?? this.id,
        carts: carts ?? this.carts,
        archer: archer ?? this.archer,
        qty: qty ?? this.qty,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        user: user ?? this.user,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [id, carts, archer, qty, total, dateTime, user, status];
}

List<Transaction> mockTransactions = [
  Transaction(
      id: 1,
      carts: mockCarts,
      archer: mockArchers[0],
      dateTime: DateTime.now(),
      user: mockUsers[0],
      status: TransactionStatus.Paid),
];
