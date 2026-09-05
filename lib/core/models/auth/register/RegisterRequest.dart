class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? phoneNumber; // បន្ថែម phoneNumber

  RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    // បំបែក name ទៅជា firstName និង lastName
    List<String> nameParts = (name ?? "").trim().split(" ");
    String firstName = nameParts.isNotEmpty && nameParts.first.isNotEmpty ? nameParts.first : "User";
    String lastName = nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "User";

    // បង្កើត username ចេញពី email (ឧទាហរណ៍៖ test@gmail.com -> test)
    String username = (email ?? "").contains("@")
        ? email!.split("@").first
        : (name ?? "user").replaceAll(" ", "").toLowerCase();

    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber ?? "012345678", // បើទទេ ដាក់លេខសាកល្បង
      'password': password,
      'confirmPassword': passwordConfirmation ?? password, // ផ្ញើ confirmPassword ទៅ Backend
      'role': 'USER',
      'profile': '',
    };
  }
}