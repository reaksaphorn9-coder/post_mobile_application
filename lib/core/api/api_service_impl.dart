import 'dart:convert';
import 'package:http/http.dart' as httpClient;
import 'package:post_mobile_application/constants/url_constant.dart';
import 'package:post_mobile_application/core/api/api_service.dart';
import 'package:post_mobile_application/core/models/auth/login/LoginRequest.dart';
import 'package:post_mobile_application/core/models/auth/login/LoginResponse.dart';
import 'package:post_mobile_application/core/models/auth/register/RegisterRequest.dart';
import 'package:post_mobile_application/core/models/auth/register/RegisterResponse.dart';

class ApiServiceImpl implements ApiService {
  Map<String, String> headers = {"Content-Type": "application/json"};

  @override
  Future<LoginResponse> login(LoginRequest req) async {
    LoginResponse loginResponse = LoginResponse();
    var url = Uri.parse(UrlConstants.loginPath);

    try {
      var response = await httpClient.post(
        url,
        body: jsonEncode(req.toJson()),
        headers: headers,
      );

      print('Login Status Code: ${response.statusCode}');
      print('Login Response Body: ${response.body}');

      if (response.statusCode == 200) {
        loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to login: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }

    return loginResponse;
  }

  @override
  Future<dynamic> get(String url) async {
    var uri = Uri.parse(url);
    var response = await httpClient.get(
      uri,
      headers: headers,
    );

    print('Get Status Code: ${response.statusCode}');
    print('Get Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest req) async {
    var url = Uri.parse(UrlConstants.registerPath);

    try {
      var response = await httpClient.post(
        url,
        body: jsonEncode(req.toJson()),
        headers: headers,
      );

      print('Register Status Code: ${response.statusCode}');
      print('Register Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Register failed with status: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}