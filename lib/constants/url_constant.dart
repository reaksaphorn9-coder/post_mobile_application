class UrlConstants {
  UrlConstants._();

  // Base URL សម្រាប់ Android Emulator
  static const String baseUrl = "http://10.0.2.2:30033";

  // Authentication Endpoints
  static const String loginPath = "$baseUrl/api/oauth/token";
  static const String registerPath = "$baseUrl/api/oauth/register"; // កែមកជា /api/oauth/register
  static const String refreshTokenPath = "$baseUrl/api/oauth/refresh";

  // Other Endpoints
  static const String adminListPostPath = "$baseUrl/api/admin/posts";
}