import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/todo_item.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/user_profile.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/todo/dto/update_todo_dto.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: data_repository
/// Created by sujangmac
///
/// Description:
///

abstract class DataRepository {
  Future<Result<UserProfile>> login(String email, String password);
  Future<Result<void>> logout();
  Future<Result<UserProfile>> register(
      String email, String password, String name);
  Future<Result<UserProfile>> getUser();
  Future<Result<bool>> isLogin();
  Future<Result<void>> addTodoItem(String text);
  Future<Result<List<TodoItem>>> getTodoItems();
  Future<Result<void>> updateTodoItem(UpdateTodoDto dto);
  Future<Result<void>> deleteTodoItem(String todoId);
}
