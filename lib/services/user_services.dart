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

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    UserModel.token = data['access_token'];
    UserModel value = UserModel.fromJson(data['data'][0]);

    setPref(true, UserModel.token);
    setLocalUser(value);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<UserModel>> register(
      UserModel user, String password,
      {File? imageFile, http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + "register";

    Map<String, String?> params = {
      "nama_lengkap": user.name,
      "email": user.email,
      "password": password,
      "no_telp": user.phone,
      "alamat": user.address,
      "kota": user.city,
      "provinsi": user.province,
    };

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    var multiPartFile =
        await http.MultipartFile.fromPath('foto', imageFile!.path);

    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll(headers);
    request.fields.addAll(params);
    request.files.add(multiPartFile);

    var response = await request.send();

    String responseBody = await response.stream.bytesToString();
    var data = jsonDecode(responseBody);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['errors']}, Please Try Again");
    }

    UserModel.token = data['access_token'];
    UserModel value = UserModel.fromJson(data['data'][0]);

    setPref(true, UserModel.token);
    setLocalUser(value);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> logout({http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + "logout";

    String? token = await getToken();

    var response = await client.post(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    var data = jsonDecode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    return ApiReturnValue(message: data['message']);
  }

  static Future<ApiReturnValue<String>> postForgetPassEmail(
      {http.Client? client, String? email}) async {
    client ??= http.Client();

    var url = baseURL + "forgotpassword";

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{"email": email!}));

    var data = json.decode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    return ApiReturnValue(value: data['status'].toString(), message: "Sukses, Silahkan Cek Email Anda");
  }

  static Future<ApiReturnValue<String>> postForgetPassToken({http.Client? client, String? token}) async {
    client ??= http.Client();

    var url = baseURL + "checktoken";

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{"token": token!}));

    var data = json.decode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    return ApiReturnValue(value: data['status'].toString(), message: data['message']);
  }

  static Future<ApiReturnValue<String>> resetPass(
      {http.Client? client, String? email, String? password, String? confPassword}) async {
    client ??= http.Client();

    var url = baseURL + "resetpassword";

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "email": email!,
          "password": password!,
          "confirm_password": confPassword!
        }));

    var data = json.decode(response.body);

    if (data['status'] != 200) {
      return ApiReturnValue(message: "${data['message']}, Please Try Again");
    }

    return ApiReturnValue(value: data['status'].toString(), message: data['message']);
  }
}
