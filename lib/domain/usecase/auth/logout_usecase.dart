import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/usecase.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: logout_usecase
/// Created by sujangmac
///
/// Description:
///

class LogoutUseCase implements UseCase<void, void> {
  final DataRepository _dataRepository;

  const LogoutUseCase(this._dataRepository);

  @override
  Future<void> call(void params, {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.logout();
    if (result is ResultError) {
      onError(result.error!);
    }
  }
}
