import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/models/country_model.dart';

abstract class AssetRepository extends GetxController {
  static AssetRepository get to => Get.find();

  Future<List<CountryModel>> getCountries();
}

class AssetRepositoryImpl extends GetxController implements AssetRepository {
  List<CountryModel>? _countries;

  @override
  Future<List<CountryModel>> getCountries() async {
    if (_countries == null) {
      await rootBundle
          .loadString('assets/jsons/model/country_codes.json')
          .then((value) => {
                _countries = (json.decode(value) as List)
                    .map((e) => CountryModel.fromJson(e))
                    .toList()
              });
    }
    return _countries ?? [];
  }
}
