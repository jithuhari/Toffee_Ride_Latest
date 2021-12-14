import 'package:get/get.dart';
import 'package:toffee_ride/managers/hive/hive.dart';
import 'package:toffee_ride/models/account_model.dart';
import 'package:toffee_ride/models/subject_model.dart';
import 'package:toffee_ride/models/user_model.dart';

abstract class DbRepository extends GetxController {
  static DbRepository get to => Get.find();

  Future<bool> isAppAlreadyRun();
  UserModel? getUser();
  insertUserAndAccount(UserModel user, List<AccountModel> accounts);
  List<AccountModel> getAccounts();
  insertSubjects(List<SubjectModel> subjects);
  clearData();
}

class DbRepositoryImpl extends GetxController implements DbRepository {
  final _helper = HiveHelper();

  @override
  Future<bool> isAppAlreadyRun() async {
    return await _helper.isAppAlreadyRun();
  }

  @override
  UserModel? getUser() {
    return _helper.getUser();
  }

  @override
  insertUserAndAccount(UserModel user, List<AccountModel> accounts) {
    return _helper.insertUserAndAccount(user, accounts);
  }

  @override
  List<AccountModel> getAccounts() {
    return _helper.getAccounts();
  }

  @override
  insertSubjects(List<SubjectModel> subjects) async {
    await _helper.insertSubjects(subjects);
  }

  @override
  clearData() async {
    await _helper.clearData();
  }
}
