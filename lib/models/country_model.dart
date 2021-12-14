class CountryModel {
  final String? name;
  final String? dialCode;
  final String? code;
  final String? currency;

  CountryModel(this.name, this.dialCode, this.code, this.currency);

  factory CountryModel.fromJson(dynamic json) {
    return CountryModel(
        json['name'], json['dial_code'], json['code'], json['currency']);
  }
}