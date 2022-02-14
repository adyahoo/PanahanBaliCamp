part of 'services.dart';

class PertandinganServices {
  static Future<ApiReturnValue<List<PertandinganModel>>> getPertandingans({http.Client? client}) async {
    client ??= http.Client();

    var url = baseURL + "match/1";

    String? token = await getToken();

    var response = await client.get(url, headers: {
      "Authorization": "Bearer $token",
    });

    var data = jsonDecode(response.body);

    if (data['status'] != "200") {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    List<PertandinganModel> pertandingans = (data['data'] as Iterable).map((e) => PertandinganModel.fromJson(e)).toList();

    return ApiReturnValue(value: pertandingans);
  }
}