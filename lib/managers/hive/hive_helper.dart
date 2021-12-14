import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toffee_ride/models/account_model.dart';
import 'package:toffee_ride/models/subject_model.dart';
import 'package:toffee_ride/models/user_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HiveHelper {
  static const settingsBoxName = "settingsBox";
  static const userBoxName = "userBox";
  static const accountBoxName = "accountBox";
  static const subjectBoxName = "subjectBox";

  static const isAlreadyRunKey = "isAlreadyRun";

  _initializeHive() async {
    if (!kIsWeb) {
      Directory directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path);
    } else {
      await Hive.initFlutter();
    }
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AccountModelAdapter());
    Hive.registerAdapter(SubjectModelAdapter());

    await Hive.openBox(settingsBoxName);
    await Hive.openBox<UserModel>(userBoxName);
    await Hive.openBox<AccountModel>(accountBoxName);
    await Hive.openBox<SubjectModel>(subjectBoxName);
  }

  //get user
  //first to be called

  Future<bool> isAppAlreadyRun() async {
    await _initializeHive();
    var settingsBox = Hive.box(settingsBoxName);

    final bool? isAlreadyRun = settingsBox.get(isAlreadyRunKey);
    if (isAlreadyRun != null) {
      return true;
    }
    settingsBox.put(isAlreadyRunKey, true);
    return false;
  }

  UserModel? getUser() {
    final userBox = Hive.box<UserModel>(userBoxName);

    final List<UserModel> users = userBox.values.toList();
    return users.isNotEmpty ? users.first : null;
  }

  //insert user and accounts
  insertUserAndAccount(UserModel user, List<AccountModel> accounts) {
    Box userBox = Hive.box<UserModel>(userBoxName);
    userBox.add(user);

    Box accountBox = Hive.box<AccountModel>(accountBoxName);
    for (final e in accounts) {
      accountBox.add(e);
    }
  }

  //get accounts
  List<AccountModel> getAccounts() {
    var accountBox = Hive.box<AccountModel>(accountBoxName);
    return accountBox.values.toList();
  }

  //insert user and accounts
  insertSubjects(List<SubjectModel> subjects) async {
    Box subjectBox = Hive.box<SubjectModel>(subjectBoxName);
    await subjectBox.clear();

    for (final e in subjects) {
      subjectBox.add(e);
    }
  }

  clearData() async {
    Box userBox = Hive.box<UserModel>(userBoxName);
    await userBox.clear();

    Box accountBox = Hive.box<AccountModel>(accountBoxName);
    await accountBox.clear();

    Box subjectBox = Hive.box<SubjectModel>(subjectBoxName);
    await subjectBox.clear();
  }
}
