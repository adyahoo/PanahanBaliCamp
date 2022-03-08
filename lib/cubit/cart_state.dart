part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<Cart>? carts;

  CartLoaded(this.carts);

  @override
  List<Object?> get props => [carts];
}

class CartLoadedFailed extends CartState {
  final String? msg;

  CartLoadedFailed(this.msg);

  @override
  List<Object?> get props => [msg];
}

class CartPostSuccess extends CartState {
  final String? msg;

  CartPostSuccess(this.msg);

  @override
  List<Object?> get props => [msg];
}