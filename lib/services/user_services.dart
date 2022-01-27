part of 'services.dart';

class UserService {
  static Future<ApiReturnValue<UserModel>> login(String email, String password,
      {http.Client? client}) async {
    if (email == '' || password == '') {
      return ApiReturnValue(message: "Please Fill All The Field");
    }

    client ??= http.Client();

    String url = baseURL + 'login';

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['message'] + ": Please Try Again");
    }

    UserModel.token = data['access_token'];
    UserModel value = UserModel.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}