part of 'services.dart';

class CartService {
  static Future<ApiReturnValue<List<Cart>>> getCarts(
      {http.Client? client, int? userId}) async {
    client ??= http.Client();

    var url = baseURL + "cart/$userId";

    String? token = await getToken();

    var response =
        await client.get(url, headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    List<Cart> carts =
        (data['data'] as Iterable).map((e) => Cart.fromJson(e)).toList();

    return ApiReturnValue(value: carts);
  }

  static Future<ApiReturnValue<String>> postCart(
      {http.Client? client,
      int? userId,
      int? itemId,
      String? itemType = "barang",
      int? qty}) async {
    client ??= http.Client();

    var url = baseURL + "cart/add";

    String? token = await getToken();

    var response = await client.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          "user_id": userId,
          "package_item_id": itemId,
          "type_item": itemType,
          "qty": qty
        }));

    var data = jsonDecode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    return ApiReturnValue(
        value: data['status'].toString(), message: data['message']);
  }

  static Future<ApiReturnValue<String>> editQtyCart(
      {http.Client? client, int? cartId, int? qty}) async {
    client ??= http.Client();

    var url = baseURL + "cart/update/$cartId";

    String? token = await getToken();

    var response = await client.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(<String, int>{"qty": qty!}));

    var data = jsonDecode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    return ApiReturnValue(value: data['status'].toString(), message: data['message']);
  }

  static Future<ApiReturnValue<String>> deleteCart({http.Client? client, int? cartId}) async {
    client ??= http.Client();

    var url = baseURL + "cart/delete/$cartId";

    String? token = await getToken();

    var response = await client.post(url, headers: {
      "Authorization": "Bearer $token"
    });

    var data = jsonDecode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    return ApiReturnValue(value: data['status'].toString(), message: data['message']);
  }
}
