import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/dto/register_dto.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/register_usecase.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/injector.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/page/widget/email_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: register_provider
/// Created by sujangmac
///
/// Description:
///
class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(RegisterState.initial());

  Future<void> register(RegisterDto dto) async {
    state = RegisterState.loading();
    final registerUseCase = locator<RegisterUseCase>();
    await registerUseCase(dto, onError: (error) {
      state = RegisterState.error(error.toString());
    });
    state = RegisterState.success();
  }
}

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>(
        (_) => RegisterNotifier());

class RegisterState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const RegisterState(
      {this.isLoading = false, this.isSuccess = false, this.errorMessage});

  factory RegisterState.initial() => const RegisterState();

  factory RegisterState.loading() => const RegisterState(isLoading: true);

  factory RegisterState.success() => const RegisterState(isSuccess: true);

  factory RegisterState.error(String errorMessage) =>
      RegisterState(errorMessage: errorMessage);
}
