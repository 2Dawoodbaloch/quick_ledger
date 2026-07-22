class RegisterRequest {
  final String name;
  final String email;
  final String phone;
  final String businessName;
  final String businessType;
  final String password;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.businessName,
    required this.businessType,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "business_name": businessName,
      "business_type": businessType,
      "password": password,
    };
  }
}