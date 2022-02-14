part of 'services.dart';

class CityService {
  static Future<ApiReturnValue<List<CityModel>>> getCities(
      {int? provinceId, http.Client? client}) async {
    client ??= http.Client();

    String url = locationBaseUrl + 'kota?id_provinsi=$provinceId';
    var response = await client.get(url);
    
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please Try Again");
    }
    
    var data = jsonDecode(response.body);

    List<CityModel> cities = (data['kota_kabupaten'] as Iterable).map((e) => CityModel.fromJson(e)).toList();

    return ApiReturnValue(value: cities);
  }
}
