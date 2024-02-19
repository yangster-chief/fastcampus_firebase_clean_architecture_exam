import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/user_profile.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/dto/login_dto.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: login_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class LoginUseCase implements UseCase<UserProfile, LoginDto> {
  final DataRepository _dataRepository;

  const LoginUseCase(this._dataRepository);

  @override
  Future<UserProfile> call(LoginDto params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.login(params.email, params.password);
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }
}
