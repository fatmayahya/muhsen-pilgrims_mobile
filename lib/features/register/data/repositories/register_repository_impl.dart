import '../../domain/repositories/register_repository.dart';
import '../datasources/register_remote_datasource.dart';


class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl(this.remoteDataSource);

  // ═══════════════════════════════════════════════════════════
  // 🔹 Request OTP
  // ═══════════════════════════════════════════════════════════

  @override
  Future<String> requestOtp({
    required String passportNo,
    required String mobileNo,
  }) async {
    try {
      return await remoteDataSource.requestOtp(
        passportNo: passportNo,
        mobileNo: mobileNo,
      );
    } catch (e) {
      rethrow; 
    }
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 Activate OTP
  // ═══════════════════════════════════════════════════════════

  @override
  Future<void> activateOtp({
    required String otpRef,
    required String passportNo,
    required String otpCode,
    required String password,
  }) async {
    try {
      await remoteDataSource.activateOtp(
        otpRef: otpRef,
        passportNo: passportNo,
        otpCode: otpCode,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }
}