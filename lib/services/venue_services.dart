part of 'services.dart';

class VenueServices {
  static Future<ApiReturnValue<List<VenueModel>>> getVenues({http.Client? client}) async {
    client ??= http.Client();

    var url = baseURL + "venues";

    String? token = await getToken();

    var response = await client.get(url, headers: {
      "Authorization": "Bearer $token",
    });

    var data = jsonDecode(response.body);

    if (data['status'] != "200") {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    List<VenueModel> venues = (data['data'] as Iterable).map((e) => VenueModel.fromJson(e)).toList();

    return ApiReturnValue(value: venues);
  }
}