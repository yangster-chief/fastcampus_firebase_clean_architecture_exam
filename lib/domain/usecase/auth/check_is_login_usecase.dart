import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: check_is_login_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class CheckIsLoginUseCase implements UseCase<bool, void> {
  final DataRepository _dataRepository;

  const CheckIsLoginUseCase(this._dataRepository);

  @override
  Future<bool> call(void params, {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.isLogin();
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }
}
