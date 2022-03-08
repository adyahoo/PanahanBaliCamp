import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCarts(int userId) async {
    ApiReturnValue<List<Cart>> result =
        await CartService.getCarts(userId: userId);

    if (result.value != null) {
      emit(CartLoaded(result.value));
    } else {
      emit(CartLoadedFailed(result.message));
    }
  }

  Future<void> postCarts(int userId, int itemId, String? type, int qty) async {
    ApiReturnValue<String> result = await CartService.postCart(
        userId: userId, itemId: itemId, itemType: type, qty: qty);
    
    if (result.value == "200") {
      emit(CartPostSuccess(result.message));
    } else {
      emit(CartLoadedFailed(result.message));
    }
  }

  Future<void> editQtyCart(int cartId, int qty) async {
    ApiReturnValue<String> result = await CartService.editQtyCart(cartId: cartId, qty: qty);

    if (result.value == "200") {
      emit(CartPostSuccess(result.message));
    } else {
      emit(CartLoadedFailed(result.message));
    }
  }

  Future<void> deleteCart(int cartId) async {
    ApiReturnValue<String> result = await CartService.deleteCart(cartId: cartId);

    if (result.value == "200") {
      emit(CartPostSuccess(result.message));
    } else {
      emit(CartLoadedFailed(result.message));
    }
  }
}
