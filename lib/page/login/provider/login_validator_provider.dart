import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/dto/login_dto.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/page/widget/email_input.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/page/widget/password_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: login_validator_provider
/// Created by sujangmac
///
/// Description:
///

class LoginValidator extends StateNotifier<LoginFormState> {
  LoginValidator() : super(const LoginFormState());

  void emailChanged(String email) {
    final emailInput = EmailInput.dirty(value: email);
    state = state.copyWith(email: email, isEmailValid: emailInput.isValid);
  }

  void passwordChanged(String password) {
    final passwordInput = PasswordInput.dirty(value: password);
    state = state.copyWith(
        password: password, isPasswordValid: passwordInput.isValid);
  }

  LoginDto getEmailAndPassword() {
    return LoginDto(email: state.email, password: state.password);
  }
}

final loginValidatorProvider =
    StateNotifierProvider<LoginValidator, LoginFormState>(
        (_) => LoginValidator());

class LoginFormState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;

  const LoginFormState({
    this.email = '',
    this.password = '',
    this.isEmailValid = false,
    this.isPasswordValid = false,
  });

  bool get canSubmit => isEmailValid && isPasswordValid;

  LoginFormState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) =>
      LoginFormState(
        email: email ?? this.email,
        password: password ?? this.password,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      );
}
