import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/todo/dto/update_todo_dto.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: update_todo_item_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class UpdateTodoItemUseCase implements UseCase<void, UpdateTodoDto> {
  final DataRepository _dataRepository;

  const UpdateTodoItemUseCase(this._dataRepository);

  @override
  Future<void> call(UpdateTodoDto params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.updateTodoItem(params);
    if (result is ResultError) {
      onError(result.error!);
    }
  }
}
