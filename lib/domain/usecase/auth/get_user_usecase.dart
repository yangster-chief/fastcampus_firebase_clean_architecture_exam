import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/user_profile.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: get_user_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class GetUserUseCase implements UseCase<UserProfile, void> {
  final DataRepository _dataRepository;

  const GetUserUseCase(this._dataRepository);

  @override
  Future<UserProfile> call(void params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.getUser();
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }
}
