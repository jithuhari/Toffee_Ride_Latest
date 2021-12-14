import 'package:get/get.dart';
import 'package:toffee_ride/managers/api/api.dart';
import 'package:toffee_ride/models/dto/dto.dart';
import 'package:toffee_ride/models/dto/get_subject_details/get_subject_details_request.dart';
import 'package:toffee_ride/models/dto/get_subject_details/get_subject_details_response.dart';

abstract class ApiRepository extends GetxController {
  static ApiRepository get to => Get.find();

  Future<LoginResponse> loginWithMobile({required String mobile});

  Future<LoginResponse> loginWithEmail({required String email});

  Future<RegistrationResponse> registerWithMobile(
      {required String studentClass,
      required String studentGender,
      required String studentName,
      required String mobile});

  Future<RegistrationResponse> registerWithEmail(
      {required String studentClass,
      required String studentGender,
      required String studentName,
      required String email});

  Future<OtpResponse> otpVerificationMobile(
      {required String otp,
      required String isLogin,
      required String mobile,
      required String mobileCode});

  Future<OtpResponse> otpVerificationEmail(
      {required String otp, required String isLogin, required String email});

  Future<FetchSubjectsResponse> fetchSubjects(
      {required FetchSubjectsRequest request});

  Future<GetSubjectDetailsResponse> getSubjectDetails(
      {required GetSubjectDetailsRequest request});
}

class ApiRepositoryImpl extends GetxController implements ApiRepository {
  ApiBaseHelper helper = ApiBaseHelper();

  @override
  Future<LoginResponse> loginWithMobile({required String mobile}) async {
    final params = {'mobile': mobile};
    final response = await helper.get(
        endpoint: ApiEndPoints.loginWithMobile, params: params);
    return LoginResponse.fromJson(response);
  }

  @override
  Future<LoginResponse> loginWithEmail({required String email}) async {
    final params = {'email': email};
    final response =
        await helper.get(endpoint: ApiEndPoints.loginWithEmail, params: params);
    return LoginResponse.fromJson(response);
  }

  @override
  Future<RegistrationResponse> registerWithMobile(
      {required String studentClass,
      required String studentGender,
      required String studentName,
      required String mobile}) async {
    final params = {
      'mobile': mobile,
      'gender': studentGender,
      'child_name': studentName,
      'class': studentClass
    };
    final response = await helper.post(ApiEndPoints.registerWithMobile, params);
    return RegistrationResponse.fromJson(response);
  }

  @override
  Future<RegistrationResponse> registerWithEmail(
      {required String studentClass,
      required String studentGender,
      required String studentName,
      required String email}) async {
    final params = {
      'email': email,
      'gender': studentGender,
      'child_name': studentName,
      'class': studentClass
    };
    final response = await helper.post(ApiEndPoints.registerWithEmail, params);
    return RegistrationResponse.fromJson(response);
  }

  @override
  Future<OtpResponse> otpVerificationMobile(
      {required String otp,
      required String isLogin,
      required String mobile,
      required String mobileCode}) async {
    final params = {
      'otp': otp,
      'login': isLogin,
      'mobile': mobile,
      'mobile_code': mobileCode,
    };
    print(params);
    final response = await helper.get(
        endpoint: ApiEndPoints.validateMobileOtp, params: params);
    return OtpResponse.fromJson(response);
  }

  @override
  Future<OtpResponse> otpVerificationEmail(
      {required String otp,
      required String isLogin,
      required String email}) async {
    final params = {
      'otp': otp,
      'login': isLogin,
      'email': email,
    };

    final response = await helper.get(
        endpoint: ApiEndPoints.validateEmailOtp, params: params);
    return OtpResponse.fromJson(response);
  }

  @override
  Future<FetchSubjectsResponse> fetchSubjects(
      {required FetchSubjectsRequest request}) async {
    final response = await helper.get(
        endpoint: ApiEndPoints.subjects,
        params: {},
        headers: request.getHeader());
    return FetchSubjectsResponse.fromJson(response);
  }

  @override
  Future<GetSubjectDetailsResponse> getSubjectDetails(
      {required GetSubjectDetailsRequest request}) async {
    final response = await helper.get(
        endpoint: ApiEndPoints.subjectDetails,
        params: request.toMap(),
        headers: request.getHeader());
    return GetSubjectDetailsResponse.fromJson(response);
  }
}
