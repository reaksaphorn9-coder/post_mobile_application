class RegisterResponse {
  String? message;
  bool? success;

  RegisterResponse({
    this.message,
    this.success,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      success: json['success'] ?? json['status'],
    );
  }
}