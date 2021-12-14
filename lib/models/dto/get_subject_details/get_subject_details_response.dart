import 'package:toffee_ride/models/module_model.dart';

class GetSubjectDetailsResponse {
  GetSubjectDetailsResponse({
    required this.success,
    required this.data,
  });

  bool success;
  dynamic data;

  factory GetSubjectDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetSubjectDetailsResponse(
        success: json["success"],
        data: json["data"],
      );

  List<ModuleModel> getModules() {
    final items = data["items"];
    return items != null && success
        ? List<ModuleModel>.from(items.map((x) => ModuleModel.fromMap(x)))
        : [];
  }
}
