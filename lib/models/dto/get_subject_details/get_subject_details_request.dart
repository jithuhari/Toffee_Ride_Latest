import 'package:toffee_ride/models/account_model.dart';
import 'package:toffee_ride/models/user_model.dart';

class GetSubjectDetailsRequest {
  GetSubjectDetailsRequest(
      {required this.user,
      required this.account,
      required this.subjectId,
      required this.subjectName,
      required this.grade});

  UserModel user;
  AccountModel account;
  String subjectId;
  String subjectName;
  String grade;

  Map<String, String> getHeader() {
    return {
      'Content-Type': 'application/json',
      'user-id': user.id ?? '',
      'account-id': account.id ?? ''
    };
  }

  Map<String, String> toMap() {
    return {
      'Content-Type': 'application/json',
      'id': subjectId,
      'subject': subjectName,
      'grade': grade
    };
  }
}
