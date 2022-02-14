part of 'services.dart';

class ArcherServices {
  static Future<ApiReturnValue<List<ArcherModel>>> getArchers(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + "items";

    String? token = await getToken();

    var response =
        await client.get(url, headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (data['status'] != "200") {
      return ApiReturnValue(message: "${data['status']}, Please Try Again");
    }

    List<ArcherModel> archers =
        (data['data'] as Iterable).map((e) => ArcherModel.fromJson(e)).toList();

    return ApiReturnValue(value: archers);
  }
}
