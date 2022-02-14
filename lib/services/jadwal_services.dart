part of 'services.dart';

class JadwalServices {
  static Future<ApiReturnValue<List<JadwalModel>>> getJadwals(
      {http.Client? client}) async {
    client ??= http.Client();

    var url = baseURL + "schedulle/1";

    String? token = await getToken();

    var response = await client.get(url, headers: {
      "Authorization": "Bearer $token",
    });

    var data = jsonDecode(response.body);

    if (data['status'] != "200") {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    List<JadwalModel> jadwals =
        (data['data'] as Iterable).map((e) => JadwalModel.fromJson(e)).toList();

    return ApiReturnValue(value: jadwals);
  }
}
