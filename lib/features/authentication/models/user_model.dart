import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
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


  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        phone: data['phoneNumber'] ?? '',
        businessName: data['businessName'] ?? '',
        businessType: data['businessType'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
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

  /// static function to create an empty user model
  static UserModel empty() => UserModel(
    id: "",
    name: "",
    email: "",
    phone: "",
    businessName: "",
    businessType: "",
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    email: json['email'] ?? '',
    phone: json['phone'] ?? '',
    businessName: json['business_name'] ?? json['businessName'] ?? '',
    businessType: json['business_type'] ?? json['businessType'] ?? '',
  );
}
}
