import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/user_profile.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/dto/register_dto.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: register_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class RegisterUseCase implements UseCase<UserProfile, RegisterDto> {
  final DataRepository _dataRepository;

  const RegisterUseCase(this._dataRepository);

  @override
  Future<UserProfile> call(RegisterDto params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.register(
        params.email, params.password, params.name);
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }
}
