abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String passportNo;
  final String mobileNo;
  final String password;

  RegisterSubmitted({
    required this.passportNo,
    required this.mobileNo,
    required this.password,
  });
}
