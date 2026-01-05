
abstract class RegisterRepository {
 
  Future<String> requestOtp({
    required String passportNo,
    required String mobileNo,
  });


  Future<void> activateOtp({
    required String otpRef,
    required String passportNo,
    required String otpCode,
    required String password,
  });
}