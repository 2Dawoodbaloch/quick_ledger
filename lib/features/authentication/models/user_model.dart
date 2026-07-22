class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String businessName;
  final String businessType;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.businessName,
    required this.businessType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      businessName: json['business_name'],
      businessType: json['business_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "business_name": businessName,
      "business_type": businessType,
    };
  }
}