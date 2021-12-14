import 'package:toffee_ride/models/subject_model.dart';

class FetchSubjectsResponse {
  FetchSubjectsResponse({
    required this.success,
    required this.data,
  });

  bool success;
  dynamic data;

  factory FetchSubjectsResponse.fromJson(Map<String, dynamic> json) => FetchSubjectsResponse(
        success: json["success"],
        data: json["data"],
      );

  List<SubjectModel> getSubjects() {
    return data != null && success
        ? List<SubjectModel>.from(
            data.map((x) => SubjectModel.fromMap(x)))
        : [];
  }
}