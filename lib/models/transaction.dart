part of 'models.dart';

enum TransactionStatus { OnProgress, Completed, Paid }

class Transaction extends Equatable {
  final int id;
  final List<Cart> carts;
  final DateTime dateTime;
  final UserModel user;
  final TransactionStatus status;

  Transaction(
    this.id,
    this.carts,
    this.dateTime,
    this.user,
    this.status,
  );

  Transaction copyWith(
      {int? id,
      List<Cart>? carts,
      DateTime? dateTime,
      UserModel? user,
      TransactionStatus? status}) {
    return Transaction(id ?? this.id, carts ?? this.carts,
        dateTime ?? this.dateTime, user ?? this.user, status ?? this.status);
  }

  @override
  List<Object?> get props => [id, carts, dateTime, user];
}

List<Transaction> mockTransactions = [
  Transaction(1, mockCarts, DateTime.now(), mockUsers[0], TransactionStatus.Paid),
];
