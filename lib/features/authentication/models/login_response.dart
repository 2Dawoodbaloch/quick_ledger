import 'package:quick_ledger/features/authentication/models/user_model.dart';

class LoginResponse {
  final bool success;
  final String message;
  final String token;
  final UserModel user;

  LoginResponse({
    required this.success,
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json["success"],
      message: json["message"],
      token: json["token"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}