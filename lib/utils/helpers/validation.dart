const String emptyFields = "Please fill all the fields";

abstract class ValidationStatus {}

class ValidationSuccess extends ValidationStatus {
  @override
  String toString() {
    return "success";
  }
}

class ValidationError extends ValidationStatus {
  final String errorMessage;

  ValidationError({required this.errorMessage});

  @override
  String toString() {
    return errorMessage;
  }
}
