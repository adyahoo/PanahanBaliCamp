part of 'services.dart';

class ProvinceService {
  static Future<ApiReturnValue<List<ProvinceModel>>> getProvinces({http.Client? client}) async {
    client ??= http.Client();

    String url = locationBaseUrl + 'provinsi';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please Try Again");
    }

    var data = jsonDecode(response.body);

    List<ProvinceModel> provinces = (data['provinsi'] as Iterable).map((e) => ProvinceModel.fromJson(e)).toList();

    return ApiReturnValue(value: provinces);
  }
}