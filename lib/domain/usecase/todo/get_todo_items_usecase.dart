import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/todo_item.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: get_todo_items_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class GetTodoItemsUseCase implements UseCase<List<TodoItem>, void> {
  final DataRepository _dataRepository;

  const GetTodoItemsUseCase(this._dataRepository);

  @override
  Future<List<TodoItem>> call(void params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.getTodoItems();
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }
}
