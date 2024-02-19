///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: register_dto
/// Created by sujangmac
///
/// Description:
///
class RegisterDto {
  final String email;
  final String password;
  final String name;

  const RegisterDto(
      {required this.email, required this.password, required this.name});
}
