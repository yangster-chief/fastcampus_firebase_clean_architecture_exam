import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/user_profile.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/dto/login_dto.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/login_usecase.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: login_provider
/// Created by sujangmac
///
/// Description:
///

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState.initial());

  Future<void> login(LoginDto dto) async {
    state = LoginState.loading();
    final loginUseCase = locator<LoginUseCase>();
    final result = await loginUseCase(dto, onError: (error) {
      state = LoginState.error(error.toString());
    });
    state = LoginState.success(result);
  }
}

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((_) => LoginNotifier());

class LoginState {
  final bool isLoading;
  final UserProfile? userProfile;
  final String? errorMessage;

  LoginState({this.isLoading = false, this.userProfile, this.errorMessage});

  factory LoginState.initial() => LoginState();

  factory LoginState.loading() => LoginState(isLoading: true);

  factory LoginState.success(UserProfile userProfile) =>
      LoginState(userProfile: userProfile);

  factory LoginState.error(String errorMessage) =>
      LoginState(errorMessage: errorMessage);
}
