import 'package:post_mobile_application/core/models/auth/login/LoginRequest.dart';
import 'package:post_mobile_application/core/models/auth/login/LoginResponse.dart';
import 'package:post_mobile_application/core/models/auth/register/RegisterRequest.dart'; // 👈 បន្ថែមបន្ទាត់នេះ
import 'package:post_mobile_application/core/models/auth/register/RegisterResponse.dart';

abstract class ApiService {
  Future<LoginResponse> login(LoginRequest req);
  Future<RegisterResponse> register(RegisterRequest req);
  Future<dynamic> get(String endpoint);
}