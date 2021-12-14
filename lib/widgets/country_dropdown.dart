import 'package:flutter/material.dart';
import 'package:toffee_ride/models/country_model.dart';
import 'package:toffee_ride/utils/theme/theme.dart';

class CountryDropDown extends StatelessWidget {
  const CountryDropDown(
      {Key? key,
      required this.context,
      required this.countries,
      this.selectedCountry,
      required this.onChanged})
      : super(key: key);

  final BuildContext context;
  final List<CountryModel> countries;
  final CountryModel? selectedCountry;
  final ValueChanged<CountryModel?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: "Select a country",
      ),
      value: selectedCountry,
      items: _buildDropdownMenu(context, countries),
      onChanged: onChanged,
    );
  }

  List<DropdownMenuItem<CountryModel>> _buildDropdownMenu(
      BuildContext context, List<CountryModel> countries) {
    final items = countries
        .map<DropdownMenuItem<CountryModel>>(
            (CountryModel country) => DropdownMenuItem(
                  child: Text(
                    "${country.dialCode ?? ""} ${country.name ?? ""}",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: primaryTextColor),
                  ),
                  value: country,
                ))
        .toList();
    return items;
  }
}
