class LoginResponse {
  LoginResponse({
    required this.success,
    required this.data,
  });

  bool success;
  bool data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        data: json["data"],
      );
}