import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: delete_todo_item_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class DeleteTodoItemUseCase implements UseCase<void, String> {
  final DataRepository _dataRepository;

  const DeleteTodoItemUseCase(this._dataRepository);

  @override
  Future<void> call(String params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.deleteTodoItem(params);
    if (result is ResultError) {
      onError(result.error!);
    }
  }
}
