import 'package:toffee_ride/models/account_model.dart';
import 'package:toffee_ride/models/user_model.dart';

class FetchSubjectsRequest {
  FetchSubjectsRequest({
    required this.user,
    required this.account
  });

  UserModel user;
  AccountModel account;

  Map<String, String> getHeader() {
    return {
      'Content-Type': 'application/json',
      'user-id': user.id ?? '',
      'account-id': account.id ?? ''
    };
  }
}
