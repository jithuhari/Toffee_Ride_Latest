import 'package:toffee_ride/models/account_model.dart';
import 'package:toffee_ride/models/user_model.dart';

class OtpResponse {
  OtpResponse({
    required this.success,
    required this.data,
  });

  bool success;
  dynamic data;

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      success: json["success"],
      data: json["data"],
    );
  }

  UserModel? getUser() {
    return data["user"] != null && success
        ? UserModel.fromMap(data["user"])
        : null;
  }

  List<AccountModel> getAccounts() {
    final userDict = data["user"];
    return userDict["accounts"] != null && success
        ? List<AccountModel>.from(
            userDict["accounts"].map((x) => AccountModel.fromMap(x)))
        : [];
  }
}
