part of 'services.dart';

class ScoreService {
  static Future<ApiReturnValue<List<ScoreModel>>> getScores(
      {int? jadwalId, http.Client? client}) async {
    client ??= http.Client();

    var url = baseURL + "score/$jadwalId";

    String? token = await getToken();

    var response =
        await client.get(url, headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (data['status'] != "200") {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    List<ScoreModel> scores =
        (data['data'] as Iterable).map((e) => ScoreModel.fromJson(e)).toList();

    return ApiReturnValue(value: scores);
  }

  static Future<ApiReturnValue<String>> postScore(
      {int? detailId,
      int? score,
      int? length,
      int? session,
      http.Client? client}) async {
    client ??= http.Client();

    var url = baseURL + "add/score/$detailId";

    String? token = await getToken();

    var response = await client.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(<String, int>{
          'score': score!,
          'length': length!,
          'session': session!
        }));

    var data = jsonDecode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}");
    }

    return ApiReturnValue(message: data['message']);
  }
}
