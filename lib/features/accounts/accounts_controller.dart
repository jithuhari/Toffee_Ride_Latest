import 'package:get/get.dart';
import 'package:toffee_ride/controllers/app_controller.dart';
import 'package:toffee_ride/models/account_model.dart';
import 'package:toffee_ride/repository/repository.dart';

class AccountsController extends GetxController {
  final _accounts = (List<AccountModel>.empty()).obs;
  List<AccountModel> get accounts => _accounts.value;

  final _selectedIndex = (-1).obs;
  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
    _fetchAccounts();
  }

  _fetchAccounts() async {
    final accounts = DbRepository.to.getAccounts();
    _accounts(accounts);
  }

  onSelectedAccount(int index) async {
    _selectedIndex(index);

    Future.delayed(const Duration(milliseconds: 300));

    AppController.to.selectedAccount(_accounts[index]);
  }
}

