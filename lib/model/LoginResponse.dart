class LoginResponse {
  final String status;
  final String message;
  final String token;
  final bool isRegistrationCompleted;
  final bool reqForDeletion;
  final String expiration;

  LoginResponse({
    required this.status,
    required this.message,
    required this.token,
    required this.isRegistrationCompleted,
    required this.reqForDeletion,
    required this.expiration,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      isRegistrationCompleted: json['isRegistrationCompleted'] ?? false,
      reqForDeletion: json['reqForDeletion'] ?? false,
      expiration: json['expiration'] ?? '',
    );
  }
}
