///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: usecase
/// Created by sujangmac
///
/// Description:
///
abstract class UseCase<Type, Params> {
  Future<Type> call(
    Params params, {
    required ResultErrorCallback onError,
  });
}

typedef ResultErrorCallback = void Function(Exception error);
