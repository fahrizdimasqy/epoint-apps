part of 'services.dart';

class TeacherServices {
  static Future<ApiReturnValue<Teacher>> SignIn(
      String nis, String password) async {
    await Future.delayed(Duration(microseconds: 500));
    return ApiReturnValue();
  }
}
