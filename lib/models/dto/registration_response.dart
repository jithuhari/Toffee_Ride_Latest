class RegistrationResponse {
  RegistrationResponse({
    required this.success,
    required this.data,
  });

  bool success;
  dynamic data;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      success: json["success"],
      data: json["data"],
    );
  }
}
