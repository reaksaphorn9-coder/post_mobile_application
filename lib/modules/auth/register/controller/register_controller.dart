import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_mobile_application/core/api/api_service.dart';
import 'package:post_mobile_application/core/models/auth/register/RegisterRequest.dart';

class RegisterController extends GetxController {
  final ApiService apiService;

  RegisterController({required this.apiService});

  // 1. Text Controllers សម្រាប់ទាញយកតម្លៃពី Input Fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // 2. Loading State
  var isLoading = false.obs;

  // 3. Function សម្រាប់ដំណើរការ Register
  Future<void> register() async {
    // ពិនិត្យការបញ្ចូលព័ត៌មាន (Validation)
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all required fields");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      isLoading.value = true;

      // បង្កើត Request Object
      final request = RegisterRequest(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      );

      // ហៅ ApiService
      final response = await apiService.register(request);

      isLoading.value = false;

      // ពេល Register ជោគជ័យ
      Get.snackbar("Success", "Account created successfully!");

      // ប្តូរទៅទំព័រ Login ឬ Dashboard
      // Get.offAllNamed(AppRouteName.login);

    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void onClose() {
    // Dispose controllers ដើម្បីការពារ Memory Leak
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}